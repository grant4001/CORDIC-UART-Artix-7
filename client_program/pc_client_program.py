import serial
import math
from fixedpoint import FixedPoint

def twos_complement(hexstr,bits):
     value = int(hexstr,16)
     if value & (1 << (bits-1)):
         value -= 1 << bits
     return value

def crc_8(bytearr):
    generator = 0x9b
    crc = 0
    for byte in bytearr:
        crc = crc ^ byte
        for i in range(0, 8):
            if ((crc >> 7) & 0xFF):
                crc = ((crc << 1) & 0xFF) ^ generator
            else:
                crc = ((crc << 1) & 0xFF)
    return crc

def main():
    serial_port = 'COM7'
    baud_rate = 3000000

    ser = serial.Serial(serial_port, baud_rate, timeout=3, parity=serial.PARITY_ODD)
    print("\nSuccessfully opened serial port " + str(serial_port) + " with baud rate " + str(baud_rate) + ".")

    print("\nWelcome to the Arty-A7 UART comm program. Have fun interacting with the CORDIC module!")

    # Command
    try:
        while True:

            command = input("\nEnter command (1-5):\n \
            (1- Single angle)\n \
            (2- Bursted angles)\n \
            (3- Disable)\n \
            (4- Enable)\n \
            (5- Echo Test Mode) ")

            try:

                # Convert command to integer
                command = int(command)

                # Single command
                if command == 1:

                    # Prompt user for angle
                    angle = input("\nEnter angle (degrees): ")
                    angle_rad = float(angle) * math.pi / 180.0
                    angle_rad_fixed = FixedPoint(angle_rad, signed=True, m=4, n=44)

                    # Construct message
                    packet = bytearray()
                    packet.append(0x5a)
                    packet.append(0xd1)
                    for i in reversed(range(0,6)):
                        packet.append ( int(str(angle_rad_fixed)[(i*2):(i*2)+2], 16) )
                    packet.append(crc_8(packet))
                    
                    # Print message
                    print("\nSending message: ")
                    print("\tHeader: 0x" + str(format(packet[0], '02x')))
                    print("\tCmd:    0x" + str(format(packet[1], '02x')))
                    print("\tTheta:  0x", end="")
                    for i in range(0,6):
                        print(format(packet[i+2], '02x'), end="")
                    angle_in = (twos_complement(str(angle_rad_fixed), 48) / (2**44)) * 180.0 / math.pi
                    print(" (" + str(angle_in) + ")" )
                    print("\tCRC-8:  0x" + str(format(packet[-1], '02x')))

                    # Send message
                    ser.write(packet)

                    # Read response message
                    bytes_back = ser.read(15)

                    # Format received theta
                    mycos = ''
                    mysin = ''
                    for i in reversed(range(0,6)):
                        mycos += format(bytes_back[i+2], '02x')
                        mysin += format(bytes_back[i+8], '02x')
                    print(mycos)
                    print(mysin)
                    cos_val = twos_complement(mycos, 48) / (2**46)
                    sin_val = twos_complement(mysin, 48) / (2**46)

                    # Print received message
                    print("\nReceived message: ")
                    print("\tHeader:        0x" + str(format(bytes_back[0], '02x')))
                    print("\tCmd:           0x" + str(format(bytes_back[1], '02x')))

                    print("\tCos(theta):    0x", end="")
                    for i in reversed(range(0,6)):
                        print(format(bytes_back[i+2], '02x'), end="")
                    print(" (" + str(cos_val) + ")")

                    print("\tSin(theta):    0x", end="")
                    for i in reversed(range(0,6)):
                        print(format(bytes_back[i+8], '02x'), end="")
                    print(" (" + str(sin_val) + ")")

                    print("\tCRC-8:         0x" + str(format(bytes_back[-1], '02x')))

                    # CRC-8 check
                    if crc_8(bytes_back) == 0:
                        print("\nCRC-8 of received message passes.")
                    else:
                        print("\nCRC-8 of received message does not pass.")
                    
                # Burst command
                elif command == 2:
                    
                    # Prompt user for theta(s)
                    burst_cnt = input("\nEnter burst_cnt (1-8): ")
                    burst_cnt = int(burst_cnt)
                    angle_list = []
                    for i in range(0,burst_cnt):
                        angle = input("\nEnter angle (degrees): ")
                        angle_rad = float(angle) * math.pi / 180.0
                        angle_rad_fixed = FixedPoint(angle_rad, signed=True, m=4, n=44)
                        angle_list.append(angle_rad_fixed)

                    # Construct message
                    packet = bytearray()
                    packet.append(0x5a)
                    packet.append(0xd2)
                    packet.append(burst_cnt)
                    for j in range(0,burst_cnt):
                        for i in reversed(range(0,6)):
                            packet.append ( int(str(angle_list[j])[(i*2):(i*2)+2], 16) )
                    packet.append(crc_8(packet))

                    # Print message
                    print("\nSending message: ")
                    print("\tHeader:    0x" + str(format(packet[0], '02x')))
                    print("\tCmd:       0x" + str(format(packet[1], '02x')))
                    print("\tBurst cnt: 0x" + str(format(packet[2], '02x')))
                    for j in range(0,burst_cnt):
                        print("\tTheta:     0x", end="")
                        for i in range(0,6):
                            print(str(format(packet[i+3+(j*6)], '02x')), end="")
                        angle_in = (twos_complement(str(angle_list[j]), 48) / (2**44)) * 180.0 / math.pi
                        print(" (" + str(angle_in) + ")" )
                    print("\tCRC-8:     0x" + str(format(packet[-1], '02x')))

                    # Send message
                    packet_size = 4 + burst_cnt * 12
                    ser.write(packet)

                    # Read response message
                    bytes_back = ser.read(packet_size)

                    # Format received theta
                    mycos = []
                    mysin = []
                    for j in range(0,burst_cnt):
                        mycos.append('')
                        mysin.append('')
                        for i in reversed(range(0,6)):
                            mycos[j] += format(bytes_back[i+3+(12*j)], '02x')
                            mysin[j] += format(bytes_back[i+9+(12*j)], '02x')
                    cos_val = []
                    sin_val = []
                    for val in mycos:
                        cos_val.append(twos_complement(val, 48) / (2**46))
                    for val in mysin:
                        sin_val.append(twos_complement(val, 48) / (2**46))

                    #print(cos_val)
                    #print(sin_val)
                    
                    # Print received message
                    print("\nReceived message: ")
                    print("\tHeader:        0x" + str(format(bytes_back[0], '02x')))
                    print("\tCmd:           0x" + str(format(bytes_back[1], '02x')))
                    print("\tBurst cnt:     0x" + str(format(bytes_back[2], '02x')))

                    for j in range(0,burst_cnt):
                        print("\tCos(theta):    0x", end="")
                        for i in reversed(range(0,6)):
                            print(format(bytes_back[i+3+(12*j)], '02x'), end="")
                        print(" (" + str(cos_val[j]) + ")")

                        print("\tSin(theta):    0x", end="")
                        for i in reversed(range(0,6)):
                            print(format(bytes_back[i+9+(12*j)], '02x'), end="")
                        print(" (" + str(sin_val[j]) + ")")

                    print("\tCRC-8:         0x" + str(format(bytes_back[-1], '02x')))

                    # CRC-8 check
                    if crc_8(bytes_back) == 0:
                        print("\nCRC-8 of received message passes.")
                    else:
                        print("\nCRC-8 of received message does not pass.")

                # Disable command
                elif command == 3:

                    # Construct message
                    packet = bytearray()
                    packet.append(0x5a)
                    packet.append(0xe1)
                    packet.append(crc_8(packet))
                    
                    # Print message
                    print("\nSending message: ")
                    print("\tHeader: 0x" + str(format(packet[0], '02x')))
                    print("\tCmd:    0x" + str(format(packet[1], '02x')))
                    print("\tCRC-8:  0x" + str(format(packet[-1], '02x')))

                    # Send message
                    ser.write(packet)

                    # Read received message
                    bytes_back = ser.read(3)

                    # Print received message
                    print("\nReceived message: ")
                    print("\tHeader: 0x" + str(format(bytes_back[0], '02x')))
                    print("\tCmd:    0x" + str(format(bytes_back[1], '02x')))
                    print("\tCRC-8:  0x" + str(format(bytes_back[-1], '02x')))

                    # CRC-8 check
                    if crc_8(bytes_back) == 0:
                        print("\nCRC-8 of received message passes.")
                    else:
                        print("\nCRC-8 of received message does not pass.")

                # Enable command
                elif command == 4:
                    
                    # Construct message
                    packet = bytearray()
                    packet.append(0x5a)
                    packet.append(0xe2)
                    packet.append(crc_8(packet))
                    
                    # Print message
                    print("\nSending message: ")
                    print("\tHeader: 0x" + str(format(packet[0], '02x')))
                    print("\tCmd:    0x" + str(format(packet[1], '02x')))
                    print("\tCRC-8:  0x" + str(format(packet[-1], '02x')))

                    # Send message
                    ser.write(packet)

                    # Read received message
                    bytes_back = ser.read(3)
                    
                    # Print received message
                    print("\nReceived message: ")
                    print("\tHeader: 0x" + str(format(bytes_back[0], '02x')))
                    print("\tCmd:    0x" + str(format(bytes_back[1], '02x')))
                    print("\tCRC-8:  0x" + str(format(bytes_back[-1], '02x')))

                    # CRC-8 check
                    if crc_8(bytes_back) == 0:
                        print("\nCRC-8 of received message passes.")
                    else:
                        print("\nCRC-8 of received message does not pass.")

                # Echo test command
                elif command == 5:

                    testbyte = input("\nEnter test character: ")
                    ser.write(testbyte.encode("utf-8"))
                    byte_out = ser.read(1)
                    print("\nReceived byte: " + byte_out.decode("utf-8") + "\n")

                else:

                    print("\nInvalid command. Please enter 1, 2, 3, 4, or 5.")

            except ValueError:

                print("\nInput was not an integer.")

    except KeyboardInterrupt:
        ser.close()
        pass

if __name__ == "__main__":
    main()
