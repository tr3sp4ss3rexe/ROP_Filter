cat rop.txt | grep -v -E 'clts|hlt|lmsw|ltr|lgdt|lidt|lldt|mov\ cr|mov\ dr|mov\ tr|in\  |ins|invlpg|invd|out|outs|cli|sti|popf|pushf|int|iret|iretd|swapgs|wbinvd|call|jmp|leave|ja|jb|jc|je|jr|jg|jl|jn|jo|jp|js|jz|lock|enter|wait'> rop_clean.txt

sed -i -e s/\(1\ found\)//g rop_clean.txt
    
cat rop_clean.txt | cut -d':' -f1 | sed -e 's/.\{2\}/&\ /g' | grep -i -v 00 | grep -i -v 09 | grep -i -v 0A | grep -i -v 0B | grep -i -v 0C | grep -i -v 0D | grep -i -v 20 | sed -e 's/\ //g' > good_addresses.txt
    
while read -r line
do
    grep "^$line" rop_clean.txt
done < "good_addresses.txt"
