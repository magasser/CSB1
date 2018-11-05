#!/bin/sh
# This is an example shell script showing how your code will
# be graded. It compiles _both_ Assembly programs, but only
# tests ONE of them.  The real grading script will test BOTH.
# You should extend this script to test the decoder as well.
# (Testing is part of the job of writing code.)
# Note that if you pass this script, you will receive at
# least 50% of the points for the Assembler homework!

# Assemble and link encoder
nasm -f elf64 -g -F dwarf base32enc.asm -o b32e.o || { echo "Assembly code base32enc.asm failed to compile"; exit 1; }
ld -o b32e b32e.o || { echo "Object failed to link"; exit 1; }
# Assemble and link decoder
nasm -f elf64 -g -F dwarf base32dec.asm -o b32d.o || { echo "Assembly code base32dec.asm failed to compile"; exit 1; }
ld -o b32d b32d.o || { echo "Object failed to link"; exit 1; }

# run tests with short strings
total=0
for n in A AA AB bc D13 FOO foxy lalalalalal4242
do
  points=1
  timeout -s SIGKILL 1s echo -n $n | ./b32e > $n.out || { echo "Your 'b32' command failed to run: $?" ; points=0 ; }
  echo -n $n | base32 > $n.want || { echo "System 'base32' failed to run"; exit 1; }
  diff -w $n.want $n.out > $n.delta || { echo "Encode failed on $n" ; points=0; }
  if test $points = 1
  then
    echo "Test $n passed"
    total=`expr $total + $points`
  fi
done

# Test of the encoding of a Text file
# We test the encoding of your own source file
# Then we compare with the result produced by system 'base32'
points=1
timeout -s SIGKILL 1s cat base32enc.asm | ./b32e > text.out || { echo "Your 'b32' command failed to run: $?" ; points=0 ; }
cat base32enc.asm | base32 > text.want || { echo "System 'base32' failed to run"; exit 1; }
diff -w text.want text.out > text.delta || { echo "Encode text file failed" ; points=0; }
if test $points = 1
then
  echo "Encode text file passed"
  total=`expr $total + $points`
fi

# Test of the encoding of a binary file
# We test the encoding of your own program (executable file)
# Then we compare with the result produced by system 'base32'
points=1
timeout -s SIGKILL 1s cat b32e | ./b32e > binary.out || { echo "Your 'b32' command failed to run: $?" ; points=0 ; }
cat b32e | base32 > binary.want || { echo "System 'base32' failed to run"; exit 1; }
diff -w binary.want binary.out > binary.delta || { echo "Encode binary file failed" ; points=0; }
if test $points = 1
then
  echo "Encode binary file passed"
  total=`expr $total + $points`
fi

# Output grade
echo "Final grade: $total/10"
exit 0
