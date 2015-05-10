using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SemWork.TasksFolder
{
    class Task5
    {
        private bool[] x, y, z;

        public Task5(byte n)
        {
            x = new bool[n];
            y = new bool[n];
            z = new bool[n];

            Random r = new Random();

            for (byte i = 0; i < n; i++)
            {
                x[i] = Convert.ToBoolean(r.Next(0, 2));
                y[i] = Convert.ToBoolean(r.Next(0, 2));
                z[i] = Convert.ToBoolean(r.Next(0, 2));
            }
        }

        private static void Swap(ref bool a, ref bool b)
        {
            bool temp = a;
            a = b;
            b = temp;
        }

        private static void CyclicShift(ref bool[] arrToShift, int numberOfShift)
        {
            bool[] tempArray = new bool[arrToShift.Length];
            for (int i = 0; i < arrToShift.Length; i++)
            {
                tempArray[(i + numberOfShift) % arrToShift.Length] = arrToShift[i];
            }

            arrToShift = tempArray;
        }

        private static byte[] CopyArrayBitch(bool[] mainArray)
        {
            byte[] result = new byte[mainArray.Length - 1];
            for (int i = 1; i < mainArray.Length; i++)
            {
                result[i - 1] = Convert.ToByte(mainArray[i]);
            }
            return result;
        }

        private static int ConvertToDecimal(bool[] number)
        {
            byte[] tempArray = CopyArrayBitch(number);
            if (number[0])
                return Convert.ToInt32(string.Join("", tempArray), 2);
            else
                return Convert.ToInt32(string.Join("", tempArray), 2) * -1;
        }

        private static bool[] ConvertToBinary(int number, int n)
        {
            string binary = Convert.ToString(Math.Abs(number), 2);

            bool[] temp = new bool[binary.Length];
            bool[] result = new bool[n];

            for (int i = 0; i < temp.Length; i++)
                temp[i] = Convert.ToBoolean((byte)Char.GetNumericValue(binary[i]));

            Array.Copy(temp, 0, result, n - temp.Length, temp.Length);

            if (number > 0)
                result[0] = true;
            else
                result[0] = false;

            return result;
        }

        private static bool[] ModuleSum(bool[] firstArray, bool[] secondArray, int powerOfTwo)
        {
            int modulo = (ConvertToDecimal(firstArray) + ConvertToDecimal(secondArray)) % (int)Math.Pow(2, powerOfTwo);

            return ConvertToBinary(modulo, firstArray.Length);
        }

        public void DoMyWorkBitch()
        {
            bool[] tempY = new bool[y.Length];
            bool[] tempX = new bool[x.Length];
            bool[] justTemp;
            Array.Copy(y, tempY, y.Length);
            Array.Copy(x, tempX, x.Length);
            int n = x.Length - 1;

            CyclicShift(ref tempX, 2);
            CyclicShift(ref tempY, 5);
            CyclicShift(ref z, 4);
            CyclicShift(ref y, 3);

            justTemp = ModuleSum(tempX, tempY, n);
            justTemp = ModuleSum(justTemp, z, n);

            CyclicShift(ref justTemp, 2);

            justTemp = ModuleSum(justTemp, x, n);
            justTemp = ModuleSum(justTemp, y, n);

            Console.WriteLine("==============Fifth_Task===============");
            Console.WriteLine("==============Resulted_Array===============");

            for (int i = 0; i < justTemp.Length; i++)
            {
                Console.WriteLine("{0}: {1}", i, justTemp[i]);
            }
        }
    }
}
