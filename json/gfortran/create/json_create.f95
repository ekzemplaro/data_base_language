! ------------------------------------------------------------
!	json_create.f95
!
!					Aug/22/2011
!
! ------------------------------------------------------------
character (*) function tag_gen_proc (tag,value)
	character(*) tag
	character(*) value
	character(100) str_out

	str_out = "<" // tag // ">"

	tag_gen_proc = str_out
end

! ------------------------------------------------------------
subroutine out_proc (id,name,population,date_mod,delimit)
	character(*) id
	integer population
	character(10) str_population
	character(*) name
	character(*) date_mod
	character(*) delimit
	character(100) str_out
	print*,id,name,population,date_mod
	write (str_population,'(i0)') population 
	str_out =  '"' // id // '": {"name": "' // name // '",' &
		 // '"population": ' // trim (str_population) // ',' &
		// '"date_mod": "' // date_mod // '"}' // delimit
	write (20,'(A)') str_out
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
	write (20,'(A)') '{'
	call out_proc ('t0921','宇都宮',18254,'1940-7-18',',')
	call out_proc ('t0922','小山',51627,'1940-10-21',',')
	call out_proc ('t0923','佐野',94583,'1940-5-16',',')
	call out_proc ('t0924','足利',57492,'1940-9-23',',')
	call out_proc ('t0925','日光',42861,'1940-3-9',',')
	call out_proc ('t0926','下野',89573,'1940-5-19',',')
	call out_proc ('t0927','さくら',51748,'1940-9-12',',')
	call out_proc ('t0928','矢板',94312,'1940-8-18',',')
	call out_proc ('t0929','真岡',57964,'1940-7-11',',')
	call out_proc ('t0930','栃木',56392,'1940-9-24',',')
	call out_proc ('t0931','大田原',16425,'1940-8-26',',')
	call out_proc ('t0932','鹿沼',42731,'1940-7-14',',')
	call out_proc ('t0933','鹿沼',78154,'1940-3-12',',')
	call out_proc ('t0934','那須烏山',25892,'1940-5-8','}')

close(20)

	print*, '*** 終了 ***'
END PROGRAM text_create
! ------------------------------------------------------------
