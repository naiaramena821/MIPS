
.text
la $s1,array # cargar el array
li $s2,8 # cargar el tamaño o numero de elementos
lw $t0,0($s1) # inicializa el maximo en la primera posicion del array
addi $t1,$zero,0 #contador
max:
add $t1,$t1,1 # contador
add $t2,$t1,$t1 # $t2 almacena el doble de $t1 
add $t2,$t2,$t2 # almacena el doble que seria el cuadruple
add $t2,$t2,$s1 # permite que avance en el array
lw $t3,0($t2) # carga el valor de A[i] en $t3
slt $t4,$t0,$t3 # el maximo < A[i]?
beq $t4,$zero,max # si no es verdad vuelve a max
addi $t0,$t3,0 # si es verdad A[i] es el nuevo maximo

sort: beq $a0,$a1,done # single-element list is sorted
jal max # call the max procedure
lw $t0,0($a1) # load last element into $t0
sw $t0,0($v0) # copy the last element to max loc
sw $v1,0($a1) # copy max value to last element
addi $a1,$a1,-4 # decrement pointer to last element
j sort # repeat sort for smaller list


done:
li $v1, 1# carga inmediatamente el resultado a $v1
syscall# lamada de sistema

.data
array: .word 5,10,2,2,3,1,4,44
