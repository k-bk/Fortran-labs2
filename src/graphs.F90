program main
  use mulMatrix
  implicit none
  real(kind=8) :: A(SIZE,SIZE), B(SIZE,SIZE), X(SIZE,SIZE)
  integer(kind=4) :: i, j, exit_status
  real :: start, finish

  do i = 1,SIZE
    do j = 1,SIZE
      A(i,j) = i + j
      B(i,j) = i - j
    end do
  end do

  call cpu_time( start )

  call mm( A, B, X, exit_status )

  call cpu_time( finish )

  WRITE(*,*) "Time = ", finish-start

end program main
