using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace SemWork.TasksFolder
{
    class GenerationPComparer : IComparer
    {
        int IComparer.Compare(object a, object b)
        {
            double c1 = (double)a;
            double c2 = (double)b;
            if (c1 * c1 > c2 * c2)
                return 1;
            if (c1 * c1 < c2 * c2)
                return -1;
            else
                return 0;
        }
    }
    class Task1
    {
        private const double xZero = -5.1;
        private const byte n = 15;

        private static double CalculateFunction(double x)
        {
            return ((1.2 + Math.Abs(x)) / (1.8 + Math.Abs(x - 1))) * Math.Cos(x * x + x + 1);
        }

        private static void SortShitArray(double[] b, double[] c, double m)
        {
            Array.Copy(b, 1, c, 1, b.Length - 1); c[0] = 0;
            IComparer myComparer = new GenerationPComparer();
            Array.Sort(c, myComparer);
        }
        
        public static void DoMyWorkBitch()
        {
            double[] b = new double[n + 1];
            double[] c = new double[n + 1];

            b[0] = xZero;

            for (byte i = 1; i < n + 1; i++)
            {
                b[i] = CalculateFunction(b[i - 1]);
            }

            SortShitArray(b, c, n + 1);

            byte r = 0;

            bool findNeeded = false;

            for (byte i = n; (i > 0) && (!findNeeded); i--)
            {
                if (c[i] < 0)
                {
                    r = i;
                    findNeeded = true;
                }
            }
            Console.WriteLine("==============First_Task===============");
            Console.WriteLine("================Array_X================");
            for (byte i = 1; i < n + 1; i++)
            {
                Console.WriteLine("{1}: {0:f4}; ", b[i], i);
            }

            Console.WriteLine("================Array_Y================");

            for (byte i = 1; i < n + 1; i++)
            {
                Console.WriteLine("{1}: {0:f4}; ", c[i], i);
            }

            Console.WriteLine("FUCK, OK, HERE'S YOUR R: {0}", r);
        }
    }
}
