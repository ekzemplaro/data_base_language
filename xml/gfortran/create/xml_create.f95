! ------------------------------------------------------------
!	xml_create.f95
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
subroutine out_proc (id,name,population,date_mod)
	character(*) id
	integer population
	character(10) str_population
	character(*) name
	character(*) date_mod
	print*,id,name,population,date_mod
!	write (20,*)id,'	',name,'	',population,'	',date_mod
	write (20,'(AAA)') '<',id,'>'
	write (20,*) '<name>',name,'</name>'
	write (str_population,'(i0)') population 
	write (20,*) '<population>',trim (str_population),'</population>'
	write (20,*) '<date_mod>',date_mod,'</date_mod>'
!	write (20,*) tag_gen_proc ("name",name)
!	write (20,*) str_out
	write (20,'(AAA)') '</',id,'>'
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
	write (20,'(A)') '<?xml version="1.0" encoding="utf-8"?>'
	write (20,'(A)') '<root>'
	call out_proc ('t2261','静岡',18254,'1940-7-18')
	call out_proc ('t2262','浜松',53617,'1940-10-21')
	call out_proc ('t2263','沼津',34583,'1940-5-16')
	call out_proc ('t2264','三島',57432,'1940-9-3')
	call out_proc ('t2265','富士',42831,'1940-3-9')
	call out_proc ('t2266','熱海',89573,'1940-5-19')
	call out_proc ('t2267','富士宮',52748,'1940-9-24')
	call out_proc ('t2268','藤枝',94152,'1940-8-18')
	call out_proc ('t2269','御殿場',51564,'1940-7-11')
	call out_proc ('t2270','島田',26438,'1940-9-12')
	write (20,'(A)') '</root>'
close(20)

	print*, '*** 終了 ***'
END PROGRAM text_create
! ------------------------------------------------------------
