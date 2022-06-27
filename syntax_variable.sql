#declare and set value for variable
#a variable is not only reference by name but also with @ character
#to set or assign value to a variable we have to use SET keyword
SET @var_one = 2;
SET @var_two = @var_one + 3;
SELECT @var_one, @var_two;

###############################################################
#example of using variable in mysql
#use SET to set value for @variable_name and then use @variable_name in if function and assignment
SET @rank=0, @prev_mark=0;
Select s_name,
if (@prev_mark != mark, @rank:=@rank+1, @rank) as 'rank',
@prev_mark:=mark as 'marks' from student order by mark desc;


