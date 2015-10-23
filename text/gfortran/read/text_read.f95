! ------------------------------------------------------------
!	text_read.f95
!
!					May/18/2011
!
! ------------------------------------------------------------
PROGRAM text_read
	character(100) filename
	character(72) line
	integer counter
	print*, "*** 開始 ***"
  counter = 0
call get_command_argument (1,filename)
print*, filename

open(11,file=filename,status='old')
  do
    read(11,'(A)',end=100),line
  print *,line
    counter = counter + 1
  end do
100 close(11)
  print *,'Number of lines is',counter

	print*, "*** 終了 ***"
END PROGRAM text_read
! ------------------------------------------------------------
