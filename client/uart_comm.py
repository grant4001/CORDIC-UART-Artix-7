import serial
import math
from fixedpoint import FixedPoint

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
    print("\nSuccessfully opened serial port " + str(serial_port) + " with baud rate " + str(baud_rate) + ".\n")

    print("Welcome to the Arty-A7 UART comm program. Have fun interacting with the CORDIC module!\n")

    # Command
    try:
        while True:

            command = input("Enter command (1-5):\n \
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
                    angle = input("Enter angle (degrees): ")
                    angle_rad = float(angle) * math.pi / 180.0
                    #print("Your angle (radians) is: " + str(angle_rad))
                    angle_rad_fixed = FixedPoint(angle_rad, signed=True, m=4, n=44)
                    #print("Your angle (radians, fixed point) is: " + str(angle_rad_fixed))

                    # Construct message
                    packet = bytearray()
                    packet.append(0x5a)
                    packet.append(0xd1)
                    for i in reversed(range(0,6)):
                        packet.append ( int(str(angle_rad_fixed)[(i*2):(i*2)+2], 16) )
                    packet.append(crc_8(packet))
                    
                    # Print message
                    print("Sending packet: ")
                    print("\tHeader: ", hex(packet[0]))
                    print("\tCmd:    ", hex(packet[1]))
                    print("\tTheta:  ")
                    for i in range(0,6):
                        print("\t        ", hex(packet[i+2]))
                    print("\tCRC-8:  ", hex(packet[-1]))

                    # Send message
                    ser.write(packet)
                    bytes_back = ser.read(15)
                    for i in range(0,15):
                        print(hex(bytes_back[i]))
                    #print("Received message: " + bytes_back.decode('utf-8'))
                    
                # Burst command
                elif command == 2:
                    
                    burst_cnt = input("Enter burst_cnt (1-8): ")
                    burst_cnt = int(burst_cnt)
                    angle_list = []
                    for i in range(0,burst_cnt):
                        angle = input("Enter angle (degrees): ")
                        angle_rad = float(angle) * math.pi / 180.0
                        #print("Your angle (radians) is: " + str(angle_rad))
                        angle_rad_fixed = FixedPoint(angle_rad, signed=True, m=4, n=44)
                        #print("Your angle (radians, fixed point) is: " + str(angle_rad_fixed))
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
                    print("Sending packet: ")
                    print("\tHeader:   ", hex(packet[0]))
                    print("\tCmd:      ", hex(packet[1]))
                    print("\tBurst cnt:", hex(packet[2]))
                    print("\tTheta:    ")
                    for j in range(0,burst_cnt):
                        for i in range(0,6):
                            print("\t          ", hex(packet[i+3+(j*6)]))
                    print("\tCRC-8:    ", hex(packet[-1]))

                    # Send message
                    packet_size = 4 + burst_cnt * 12
                    ser.write(packet)
                    bytes_back = ser.read(packet_size)
                    for i in range(0, packet_size):
                        print(hex(bytes_back[i]))
                    #print("Received message: " + bytes_back.decode('utf-8'))

                # Disable command
                elif command == 3:

                    # Construct message
                    packet = bytearray()
                    packet.append(0x5a)
                    packet.append(0xe1)
                    packet.append(crc_8(packet))
                    
                    # Print message
                    print("Sending packet: ")
                    print("\tHeader: ", hex(packet[0]))
                    print("\tCmd:    ", hex(packet[1]))
                    print("\tCRC-8:  ", hex(packet[-1]))

                    # Send message
                    ser.write(packet)
                    bytes_back = ser.read(3)
                    for i in range(0,3):
                        print(hex(bytes_back[i]))
                    #print("Received message: " + bytes_back.decode('utf-8'))

                # Enable command
                elif command == 4:
                    
                    # Construct message
                    packet = bytearray()
                    packet.append(0x5a)
                    packet.append(0xe2)
                    packet.append(crc_8(packet))
                    
                    # Print message
                    print("Sending packet: ")
                    print("\tHeader: ", hex(packet[0]))
                    print("\tCmd:    ", hex(packet[1]))
                    print("\tCRC-8:  ", hex(packet[-1]))

                    # Send message
                    ser.write(packet)
                    bytes_back = ser.read(3)
                    for i in range(0,3):
                        print(hex(bytes_back[i]))
                    #print("Received message: " + bytes_back.decode('utf-8'))

                # Echo test command
                elif command == 5:

                    testbyte = input("Enter test character: ")
                    ser.write(testbyte.encode("utf-8"))
                    byte_out = ser.read(1)
                    print("Received byte: " + byte_out.decode("utf-8") + "\n")

                else:

                    print("Invalid command. Please enter 1, 2, 3, 4, or 5.")

            except ValueError:

                print("Input was not an integer.")

    except KeyboardInterrupt:
        ser.close()
        pass

if __name__ == "__main__":
    main()
