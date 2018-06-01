module mulMatrix
  implicit none

contains

  subroutine mm(A, B, X, exit_status)
    implicit none
    real (kind=8), intent(in) :: A(:,:)
    real (kind=8), intent(in) :: B(:,:)
    real (kind=8), intent(out) :: X(:,:)
    integer (kind=4), intent(out) :: exit_status
    integer (kind=4) :: i, j, k, n, ma, mb, p
    integer (kind=4) :: ii, jj, kk
    logical :: ok_dim
    integer (kind=4) :: ichunk

    exit_status = -1
    n = size(A(1,:))
    ma = size(A(:,1))
    mb = size(B(1,:))
    p = size(B(:,1))

    ok_dim = .TRUE.
    ok_dim = ma .EQ. MB
    ok_dim = ok_dim .AND. (size(X(1,:)) .EQ. n)
    ok_dim = ok_dim .AND. (size(X(:,1)) .EQ. p)
    
    if (.NOT. ok_dim) then
      return
    end if

! ------------ Version 1 -------------------

#if VER == 1
    do j = 1,n
      do i = 1,p
        X(i,j) = 0
        do k = 1,ma
          X(i,j) = X(i,j) + A(k,j) * B(i,k)
        end do
      end do
    end do
#endif

! ------------ Version 2 (dot product) -----

#if VER == 2
    do j = 1,n
      do i = 1,p
        X(i,j) = dot_product(A(:,j), B(i,:))
      end do
    end do
#endif

! ------------ Version 3 (cache) -----------

#if VER == 3
    ichunk = 512 ! I have a 3MB cache too
    do jj = 1, n, ichunk
      do ii = 1, p, ichunk

        do j = jj, min(jj + ichunk - 1, n) 
          do i = ii, min(kk + ichunk - 1, p)
            X(i,j) = 0
            do k = 1, ma
              X(i,j) = X(i,j) + A(k,j) * B(i,k)
            end do
          end do
        end do

      end do
    end do
#endif

! ------------ Version 4 (both) ------------

#if VER == 4
    ichunk = 512 ! I have a 3MB cache too
    do jj = 1, n, ichunk
      do ii = 1, p, ichunk

        do j = jj, min(jj + ichunk - 1, n) 
          do i = ii, min(kk + ichunk - 1, p)
            X(i,j) = dot_product(A(:,j), B(i,:))
          end do
        end do

      end do
    end do
#endif

! ------------ Version 5 (matmul) ----------
#if VER == 5
    X = matmul(A,B)
#endif

    exit_status = 0
  end subroutine mm

end module mulMatrix

