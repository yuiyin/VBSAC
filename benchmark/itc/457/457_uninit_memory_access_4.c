// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Types of defects: Uninitialized Memory Access
 Complexity: Float 3D array partially initialized from another 3D array
*/
void uninit_memory_access_005_bad()
{
    int i,j,k;
	int arr[2][2] = {  {11, 12}, 
                          {21, 22}
                      };
    int arr1[2][2];
	for(i=0;i<1;i++)
		{
			for(j=0;j<1;j++)
			{
				
                    arr1[i][j] = arr[i][j];
					
			}
		}
	k = arr1[1][1];/*Tool should detect this line as error*/ /*ERROR:Uninitialized Memory Access*/
}

/*
* Types of defects: Uninitialized Memory Access
 Complexity: Float 3D array partially initialized from another 3D array
*/
void uninit_memory_access_005_good()
{
    int i,j,k;
	int arr[2][2] = { {11, 12}, 
                           {21, 22}
                      };
	int arr1[2][2];
	for(i=0;i<2;i++)
		{
			for(j=0;j<2;j++)
			{
				    arr1[i][j] = arr[i][j];
					
			}
		}
	k = arr1[1][1]; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Memory Access*/
}

int main () {
  uninit_memory_access_005_good();
	uninit_memory_access_005_bad();
	return 0;
}
