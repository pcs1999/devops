# using case condition 
read -p "enter your age" age 
case $age in  
 20)
  echo "you are too young"
  ;;
 25) 
  echo "you are prefect"
  ;;
 30) 
  echo "you are too old"
  ;;
  *) 
  echo "enter 20 , 25 , 30 only"
  ;;
esac 

if [ "${age}" -eq "20"]; then
   echo "you are prefect"
elif [ "${age}" -eq "25" ]; then
     echo "you are  prefect" 
elif [ "${age}" -eq "30" ]
     echo "you are too old"
else 
  echo "enter 20 , 25 , 30 only"
fi 
  
  
