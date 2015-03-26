using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SemWork.TasksFolder
{
    class Task2
    {
        private const byte n = 140, r = 9;
        private List<double> xGiven;
        private double[,] interval;
        private byte[] intervalCounter;
        private byte a;

        public byte A
        {
            get
            {
                return a;
            }
            set
            {
                if (value > 1)
                    a = 1;
                else
                    a = value;
            }
        }

        public Task2()
        {
            interval = new double[r, 2];
            intervalCounter = new byte[r];
            for (double k = 0; k < r; k++)
            {
                interval[(int) k, 0] = k / r;
                interval[(int) k, 1] = (k + 1) / r;
                intervalCounter[(int) k] = 0;
            }

            xGiven = new List<double>(new double[] { 0.687, 0.568, 0.052 });

            A = 0;
        }

        private double CalculateSubFunction(double x, double y, double z)
        {
            return Math.Pow(Math.Cos(x + y - z - A), 2);
        }

        private static double TransformationT(double num)
        {
            byte[] binary = SemesterHelper.DecToBin(num, 10);
            
            for (int i = 0; i < binary.Length / 2; i++)
            {
                binary[i] = SemesterHelper.SumModulo(binary[i], binary[binary.Length - 1 - i]);
            }

            return SemesterHelper.BinToDec(binary);
        }

        private double CalculateMainFunction(double x, double y, double z)
        {
            return TransformationT(CalculateSubFunction(x, y, z));
        }

        private void CheckInterval(double num)
        {
            for (int k = 0; k < r; k++)
            {
                if ((num >= interval[k, 0]) && (num < interval[k, 1]))
                {
                    intervalCounter[k]++;
                }
            }
        }

        //Получает x из рек. формулы и проверяет его вхождение в интервал (так делает n раз)
        private void CalculateResultedIntervalCounter()
        {
            for (int i = 0; i < n; i++)
            {
                xGiven.Add(CalculateMainFunction(xGiven[2], xGiven[1], xGiven[0]));
                CheckInterval(xGiven[3]);
                xGiven.RemoveAt(0);
            }
        }

        private double CalculateGoogleTranslateExpectedValue()
        {
            double resulted = 0;

            for (double k = 0; k <= r - 1; k++)
            {
                resulted += ((2 * k + 1) / (2 * r)) * intervalCounter[(int) k];
            }

            return resulted;
        }

        private double CalculateDispersion(double expectedValue)
        {
            double resulted = 0;

            for (double k = 0; k <= r - 1; k++)
            {
                resulted += Math.Pow((2 * k + 1) / (2 * r) - expectedValue, 2) * ((double) intervalCounter[(int) k] / n);
            }

            return resulted;
        }

        public void DoMyWorkBitch()
        {
            CalculateResultedIntervalCounter();

            double expectedValue = CalculateGoogleTranslateExpectedValue();
            double dispersionValue = CalculateDispersion(expectedValue);

            Console.WriteLine("============Second_Task_A_{0}=============", A);
            Console.WriteLine("=============Array_Epsilon==============");
            for (byte k = 0; k <= r - 1; k++)
            {
                Console.WriteLine("k is {0}: {1}", k, intervalCounter[k]);
            }
            Console.WriteLine("HERE'S YOUR FUCKING EXPECTED VALUE: {0:f4}", expectedValue);
            Console.WriteLine("HERE'S YOUR FUCKING DISPERSION VALUE: {0:f4}", dispersionValue);
        }

        public void Refresh(byte a)
        {
            for (int k = 0; k < r; k++)
            {
                intervalCounter[k] = 0;
            }

            xGiven = new List<double>(new double[] { 0.687, 0.568, 0.052 });

            A = a;
        }
    }
}
