module mulMatrix
  implicit none

contains

  subroutine mm(A, B, X, exit_status)
    implicit none
    real (kind=8), intent(in) :: A(:,:)
    real (kind=8), intent(in) :: B(:,:)
    real (kind=8), intent(out) :: X(:,:)
    integer (kind=4), intent(out) :: exit_status
    integer (kind=4) :: i, j, k
    
    ! check for bad matrix dimesions
    if (size(A(:,1)) .NE. size(B(1,:))) &
      !.OR. size(A(1,:)) .NE. size(X(1,:)) &
      !.OR. size(A(1,:)) .NE. size(X(1,:)) &
    then
      exit_status = -1
      return
    end if

    do i = 1,size(A(1,:))
      do j = 1,size(B(:,1))
        X(i,j) = 0
        do k = 1,size(A(:,1))
          X(i,j) = X(i,j) + A(k,i) * B(j,k)
        end do
      end do
    end do
    exit_status = 0

  end subroutine mm

end module mulMatrix



