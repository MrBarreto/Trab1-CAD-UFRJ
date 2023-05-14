program multi_mvec
    implicit none
    integer :: size, i, j, number, begin, last, elapsed
    real :: rand
    integer, allocatable :: matriz(:,:)
    integer, allocatable :: vetor(:)
    integer, allocatable :: result(:)
    integer, allocatable :: result2(:)
    print *, "Preencha com o tamanho da matriz "
    read(*,*) size
    allocate(matriz(size, size))
    allocate(vetor(size))
    allocate(result(size))
    allocate(result2(size))
    
    rows: do i = 1, size
        columns: do j = 1, size
            call random_number(rand)
            rand = rand*200
            number = nint(rand)
            matriz(i,j) = number
        end do columns
        j = 0
    end do rows
    i = 0
    
    do j = 1, size
        result(j) = 0
        result2(j) = 0
    end do 
    j = 0
    
    do j = 1, size
        call random_number(rand)
        rand = rand*200
        number = nint(rand)
        vetor(j) = number
    end do 
    j = 0
    
    begin = time()
    linhas: do i = 1, size
        colunas: do j = 1, size
            result(i) = result(i) + (matriz(i,j)*vetor(j))
        end do colunas
        j = 0
    end do linhas
    
    last = time()
    elapsed = last-begin
    print*, "Linhas: Passaram-se ", elapsed, "segundos"
    
    begin = time()
    
    col: do i = 1, size
        lin: do j = 1, size
            result2(j) = result2(j) + (matriz(j,i)*vetor(i))
        end do lin
        j = 0
    end do col
    
    last = time()
    elapsed = last-begin
    print*, "Colunas: Passaram-se ", elapsed, "segundos"
end program
