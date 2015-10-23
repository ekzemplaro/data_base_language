! ------------------------------------------------------------
!	text_create.f95
!
!					Jun/16/2011
!
! ------------------------------------------------------------
subroutine out_proc (id,name,population,date_mod)
	character(*) id
	integer population
	character(12) str_population
	character(*) name
	character(*) date_mod
	write (str_population,'(i0)') population
	print*,id,name,population,date_mod
	write (20,'(AAAAAAA)')id,'	',name,'	',str_population,'	',date_mod
end
! ------------------------------------------------------------
PROGRAM text_create
	character(100) filename
	character(50) line
	integer counter
	print*, '*** 開始 ***'

call get_command_argument (1,filename)
print*, filename
print*, "*** ppp ***"

open(20,file=filename,status='replace')
	call out_proc ('t2381','名古屋',18254,'1940-7-18')
	call out_proc ('t2382','豊橋',52697,'1940-10-21')
	call out_proc ('t2383','岡崎',34593,'1940-5-16')
	call out_proc ('t2384','一宮',52492,'1940-9-23')
	call out_proc ('t2385','蒲郡',41851,'1940-3-9')
	call out_proc ('t2386','常滑',82653,'1940-5-19')
	call out_proc ('t2387','大府',51748,'1940-9-12')
	call out_proc ('t2388','瀬戸',94812,'1940-8-18')
	call out_proc ('t2389','犬山',57564,'1940-7-11')
close(20)

	print*, '*** 終了 ***'
END PROGRAM text_create
! ------------------------------------------------------------
