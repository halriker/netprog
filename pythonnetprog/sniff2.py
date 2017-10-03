import socket
import sys
import os
from optparse import OptionParser
import logging

usage = 'usage: %prog [options] arg1 arg2'
parser = OptionParser()
parser.add_option('-f', '--file', dest='tgtFile', metavar='FILE', help='file containing addresses')
parser.add_option('-H', '--Host', dest='tgtHost', default='172.16.0.0/12', action='store', help='target host address')
parser.add_option('-p', '--port', dest='tgtPort', default='21', action='store', help='target TCP port')
(options, args) = parser.parse_args()


# log parameters
logging.info('START')

# if len(args) != 3:
# parser.error('incorrect number of arguments')

if len(sys.argv) == 2:
    filename = sys.argv[1]
    if not os.path.isfile(filename):
        print '[-] ' + filename + ' does not exist.'
        exit(0)
    if not os.access(filename, os.R_OK):
        print '[-] ' + filename + ' access denied.'
        exit(0)
    print "[+] Reading vulnerabilities from " + filename


def retbanner(ip, port):
    try:
        socket.setdefaulttimeout(2)
        s = socket.socket()
        s.connect((ip, port))
        banner = s.recv(1024)
        return banner
    except:
        return


def checkvulns(banner):
    f = open("vuln_banners.txt", 'r')
    for line in f.readlines():
        if line.strip('\n') in banner:
            print "[-] FTP Server is vulnerble" + banner.strip('\n')


def main():

    # create logger
    logger = logging.getLogger('sniff')
    logger.setLevel(logging.DEBUG)

    # create console handler
    ch = logging.StreamHandler()
    ch.setLevel(logging.DEBUG)

    # create file logging
    fh = logging.FileHandler('/sniff.log')
    fh.setLevel(logging.DEBUG)

    # create formatter
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')

    # add formatter to ch
    ch.setFormatter(formatter)

    # add formatter to fh
    fh.setFormatter(formatter)

    # add handlers to logger
    logger.addHandler(ch)
    logger.addHandler(fh)

    logger.info('Test')

    ip1 = '172.16.1.113'
    ip2 = '172.16.1.10'
    port = 21
    banner1 = retbanner(ip1, port)
    if banner1:
        print "[+]" + ip1 + ':' + banner1.strip('\n')
        checkvulns(banner1)
    banner2 = retbanner(ip2, port)
    if banner2:
        print "[+]" + ip2 + ':' + banner2.strip('\n')
        checkvulns(banner2)


if __name__ == '__main__':
    main()
