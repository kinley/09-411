# В Python нет гоуту, ибо не по pip8, да и вообще, рушит структуру.
# Else к первому if.
# Выполняется по схеме.
if E1:
    S1
    if E2:
        S3
        S4
        goto L1
else:
    S2
    S5
while true:
    S6
    L1:
    if not E3:
        break
