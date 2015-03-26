using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SemWork.TasksFolder;

namespace SemWork
{
    static class SemesterHelper
    {
        public static byte[] DecToBin(double number, byte precision)
        {
            List<byte> resulted = new List<byte>();
            for (int i = 0; i < precision; i++)
            {
                number *= 2;
                resulted.Add((byte)number);
                number = number - (int)number;
            }
            return resulted.ToArray();
        }

        public static double BinToDec(byte[] number)
        {
            double resulted = 0;
            int powCounter = -1;

            foreach (byte item in number)
            {
                resulted += item * Math.Pow(2, powCounter--);
            }

            return resulted;
        }

        public static byte SumModulo(byte a, byte b)
        {
            if (a + b == 2)
                return 0;
            else
                return Convert.ToByte(a + b);
        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            Task1.DoMyWorkBitch();

            Task2 temp = new Task2();
            temp.DoMyWorkBitch();
            temp.Refresh(1);
            temp.DoMyWorkBitch();

            Task4 temp2 = new Task4(5);
            temp2.DoMyWorkBitch();

            Task5 temp3 = new Task5(7);
            temp3.DoMyWorkBitch();

            Console.ReadKey();
        }
    }
}
