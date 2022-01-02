#!/usr/local/bin/ruby

Hash Converter = Hash['>' => "ptr++;",
                      '<' => "ptr--;",
                      '+' => "++(*ptr);",
                      '-' => "--(*ptr);",
                      '.' => "putchar(*ptr);",
                      ',' => "(*ptr) = getchar();",
                      '[' => "while(*ptr) {",
                      ']' => "}"]

String OutputFileName = "toto"
String CC = "gcc"
String Name = "bf"
String CFLAGS = "-Wall -Wextra"

if __FILE__ == $0
  begin
    file_in = open(ARGV[0], 'r')
    file_out = open(OutputFileName+".c", 'w')

    file_out.write("#include <stdio.h>\n#include <stdlib.h>\nint main(void) {\nchar *ptr = calloc(30000, sizeof(char));")
    file_in.each_char do |c|
      file_out.write(Converter[c])
    end
    file_out.write("return 0;}")
    file_out.close
    file_in.close
    system("#{CC} -c #{OutputFileName}.c #{CFLAGS}")
    system("#{CC} -o #{Name} #{OutputFileName}.o")
    system("./#{Name}")
    system("rm -f #{Name} #{OutputFileName}*")
  rescue Errno::ENOENT => e
    $stderr.puts("lalala #{e}")
    exit 1
  end
end
