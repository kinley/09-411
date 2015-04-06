def selection_sort(array)                                
  for i in 0...array.size do
  min_index = i
   for k in i+1...array.size do
    if array[k]<array[min_index]
    min_index = k
    end
   end
  array[i],array[min_index] = array[min_index], array[i]  
  end
return array
end

def insort(array)
  for i in 1...array.size do
   j=i
   temp=array[i]
   while j>0 && temp<array[j-1]
     array[j]=array[j-1]
     array[j-1]=temp
     j-=1
   end 
  end
  return array
end

def bubble_sort(array)
  for i in 0...array.size do
   for j in 1...array.size-i do
   if array[j-1]>array[j]
    array[j-1],array[j]=array[j],array[j-1] 
   end  
   end
  i+=1 
  end
  return array
end

def quicksort(array)     
 
 if array.size==2 && array[0]>array[-1]
   array[0],array[-1]=array[-1],array[0]
 elsif array.size<=2
   return array  
 end
 
 i=0
 j=array.size - 1                         
 while i<j
  if array[i]<array[j]
  i+=1
  elsif j-i==1
  array[j],array[i]=array[i],array[j]
  i+=1
  j-=1  
  else
  array[j-1],array[i],array[j]=array[j],array[j-1],array[i]
  j-=1    
  end  
 end
 array[0...j]=quicksort(array[0...j])
 array[i...array.size]=quicksort(array[i...array.size])                    
 return array
end

def is_sort?(array)
  for i in 1...array.size do
    if array[i-1]>array[i]
      return false
    end
  end
  return true
end
