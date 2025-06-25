
## Introduction
OverTheWire is a free online platform that teaches security concepts through interactive games. The Bandit wargame is designed to teach the basics of Linux and security concepts through a series of levels. Each level presents a unique challenge that helps you learn essential Linux commands and security practices.

## Level 0
### Task
Connect to the game server using SSH.

### Connection Details
- Server: bandit.labs.overthewire.org
- Port: 2220
- Username: bandit0
- Password: bandit0

### Solution
1. Open your terminal
2. Use the SSH command with the following format:
```bash
ssh <username>@<server> -p <port>
```
3. Enter the specific details:
```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```
4. When prompted, enter the password: `bandit0`

### What You'll Learn
- Basic SSH connection
- Understanding of ports and remote connections
- Secure shell protocol basics

## Level 1
### Task
Find the password for the next level in the home directory.

### Solution
1. After logging in, use the `ls` command to list files
2. Look for a file named `-` (hyphen)
3. Use `cat` to read the file:
```bash
cat ./-
```

### What You'll Learn
- Basic file navigation
- Reading files with special characters
- Understanding file permissions

## Level 2: 

### Task
Find the password in a file with spaces in its name.

### Solution
1. Use `ls` to find the file
2. Use quotes or escape characters to read the file:
```bash
cat "spaces in this filename"
# or
cat spaces\ in\ this\ filename
```

### What You'll Learn
- Handling filenames with spaces
- Using quotes and escape characters
- File path manipulation

## Level 3

### Task
Find the password in a hidden file.

### Solution
1. Use `ls -a` to show hidden files
2. Look for a file starting with a dot (.)
3. Use `cat` to read the hidden file

### What You'll Learn
- Working with hidden files
- Using the `-a` flag with `ls`
- Understanding file visibility in Linux

## Level 4

### Task
Find the password in a human-readable file.

### Solution
1. Use `ls -alps` to list files
2. Use `cd inhere`
3. Use `ls` 
4. Find the ASCII text file:
Use `find . -type f | xargs file`
Read it 
```bash
cat ./-file07
```

### What You'll Learn
- File type identification
- Working with different file formats
- Using the `file` commandcd 

## Level 5


### Task
Find the password in a file that is:
- Human-readable
- 1033 bytes in size
- Not executable

### Solution
1. Use `find` command with specific criteria:
```bash
find . -type f -size 1033c -not -executable
```
2. Read the found file using `cat`

### What You'll Learn
- Using `find` command with multiple criteria
- File size filtering
- File permissions and executability

## Level 6

### Task
Find the password in a file that is:
- Owned by user bandit7
- Owned by group bandit6
- 33 bytes in size

### Solution
1. Use `find` with user and group ownership:
```bash
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
```
2. Read the found file

### What You'll Learn
- File ownership concepts
- Error redirection
- Advanced `find` command usage

## Level 7


### Task
Find the password next to the word "millionth".

### Solution
1. Use `grep` to search for the word:
```bash
grep "millionth" data.txt
```

### What You'll Learn
- Text searching with `grep`
- Pattern matching
- Working with large files

## Level 8


### Task
Find the password that occurs only once in the file.

### Solution
1. Use `ls -alps`
2. Use `sort` and `uniq` to find unique lines:
```bash
sort data.txt | uniq -u
```

### What You'll Learn
- Text sorting
- Finding unique entries
- Command piping

## Level 9


### Task
Find the password in a file with human-readable strings.

### Solution
1. Use `strings` command to extract readable text:
```bash
strings data.txt | grep "=="
```

### What You'll Learn
- Working with binary files
- Using `strings` command
- Pattern matching in binary data

## Level 10

### Task
Find the password in a base64 encoded file.

### Solution
1. Use `base64` to decode the file:
```bash
base64 -d data.txt
```

### What You'll Learn
- Base64 encoding/decoding
- Working with encoded data
- Using the `base64` command

## Level 11

### Task
Find the password in a file with rotated characters.

### Solution
1. Use `tr` to rotate characters:
```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

### What You'll Learn
- Character rotation
- Using `tr` command
- Text transformation

## Level 12

### Task
Find the password in a hexdump file.

### Solution
1. Create a temporary directory: within wokring dir create mkdir /tmp/maz
cp data.txt /tmp/maz
2. Copy and decompress the file
3. Use `xxd` to convert hexdump:
```bash
xxd -r data.txt > output
```
file output 

mv output file.gz
gzip -d file.gz
ls
it will show 'file'

use file file 
output: 'file: bzip2 compressed data, block size = 900k'

mv file file.bz2
bzip2 -d file.bz2
ls 
file file 

mv file file.gz
gzip -d file.gz
ls 
file file 
file: POSIX tar archive (GNU)

mv file file.tar
tar xf file.tar
ls
data5.bin  data.txt  file.tar
file data5.bin
data5.bin: POSIX tar archive (GNU)

rm file.tar
rm data.txt
ls
data5.bin 
file data5.bin 
data5.bin: POSIX tar archive (GNU)

mv data5.bin data.tar
 tar xf data.tar
 ls 
 data6.bin  data.tar
file data6.bin
data6.bin: bzip2 compressed data, block size = 900k

mv data6.bin data.bz2
bzip2 -d data.bz2
ls 
data  data.tar
file data
data: POSIX tar archive (GNU)

mv data data.tar
tar xf data.tar
ls
data8.bin  data.tar
file data8.bin 

mv data8.bin data.gz
gzip -d data.gz
ls
file data
cat data



### What You'll Learn
- Working with hexdumps
- File compression/decompression
- Using `xxd` command

## Level 13

### Task
The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Note: localhost is a hostname that refers to the machine you are working on

### Solution
1. Identify file  `ls`
2. Use commands:
```bash
ssh -i sshkey.private -p 2220 bandit14@localhost
cat /etc/bandit_pass/bandit14
```

### What You'll Learn


## Level 14

### Task
The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

### Solution
1. Use `nc` to connect to the port:
```bash
nc localhost 30000
```
2. Enter the current level's password


### What You'll Learn
- Network connections
- Using `nc` (netcat)
- Port communication



## Level 15

### Task
The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption.

### Solution
1. ssh bandit15@bandit.labs.overthewire.org -p 2220
cat /etc/bandit_pass/bandit15
2. Use `openssl or ncat` to connect:
```bash
openssl s_client -connect localhost:30001
or 
ncat --ssl localhost 30001
```
3. Enter the current level's password

### What You'll Learn
- SSL/TLS connections
- Using `openssl and ncat`
- Secure communication


level 16
ssh bandit16@bandit.labs.overthewire.org -p 2220

find the current passsword 
cat /etc/bandit_pass/bandit16

use this to find the ipen ports in localhost 
nmap localhost -p 31000-32000

use this to acces the open port 
ncat --ssl localhost 31790

save private key in desktop and anem it bandit-key
-----BEGIN RSA PRIVATE KEY-----

chnage permission 
chmod 400 bandit-key

ssh -i bandit-key bandit17@bandit.labs.overthewire.org -p 2220


level 17 
task

use this command to find new pass 
diff passwords.old passwords.new



ssh bandit18@bandit.labs.overthewire.org -p 2220 
level 18
task

use 
ssh -t ssh bandit18@bandit.labs.overthewire.org -p 2220 
ls
cat readme

level 19
task

use commad 
ls
