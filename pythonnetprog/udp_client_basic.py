import socket

target_host = "172.20.10.5"
target_port = 80

# create a socket object
client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# send some data
client.sendto("AAABBBCCC", (target_host, target_port))

# receive some data
data, addr = client.recvfrom(4096)
print (data)
