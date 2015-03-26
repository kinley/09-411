using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SemWork.TasksFolder
{
    class Task4
    {
        private double[,] matrix;

        public Task4(byte n)
        {
            if (Enumerable.Range(5, 4).Contains(n))
                matrix = new double[n, n];
            else
                matrix = new double[5, 5];

            Random r = new Random();

            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(0); j++)
                {
                    matrix[i, j] = r.NextDouble() * 100;
                }
            }
        }

        private static void MatrixTransposition(double[,] enteredMatrix, double[,] resultedMatrix)
        {
            for (int i = 0; i < enteredMatrix.GetLength(0); i++)
            {
                for (int  j = 0;  j < enteredMatrix.GetLength(0); j++)
                {
                    resultedMatrix[j, i] = enteredMatrix[i, j];
                }
            }
        }

        private static void MatrixSymmetry(double[,] enteredMatrix, double[,] resultedMatrix)
        {
            for (int i = 0; i < enteredMatrix.GetLength(0); i++)
            {
                for (int j = 0; j < enteredMatrix.GetLength(0); j++)
                {
                    resultedMatrix[i, j] = enteredMatrix[i, j];
                }
            }

            for (int i = 0; i < resultedMatrix.GetLength(0) - 1; i++)
            {
                for (int j = i + 1; j < resultedMatrix.GetLength(0); j++)
                {
                    resultedMatrix[j, i] = resultedMatrix[i, j];
                }
            }
        }

        private static bool  SumCheck(double[,] enteredMatrix)
        {
            double sumLeft = 0;
            double sumRight = 0;

            for (int i = 0; i < enteredMatrix.GetLength(0) - 1; i++)
                for (int j = i + 1; j < enteredMatrix.GetLength(0); j++)
                    sumRight += enteredMatrix[i, j];

            for (int i = 1; i < enteredMatrix.GetLength(0); i++)
                for (int j = 0; j < i; j++)
                    sumLeft += enteredMatrix[i, j];

            if (sumLeft / sumRight >= 2)
                return true;
            else
                return false;
        }

        public void DoMyWorkBitch()
        {
            double[,] resultedMat = new double[matrix.GetLength(0), matrix.GetLength(0)];

            if (SumCheck(matrix))
                MatrixTransposition(matrix, resultedMat);
            else
                MatrixSymmetry(matrix, resultedMat);

            Console.WriteLine("==============Fourth_Task===============");
            Console.WriteLine("============Resulted_Matrix=============");

            for (int i = 0; i < resultedMat.GetLength(0); i++)
            {
                for (int j = 0; j < resultedMat.GetLength(0); j++)
                {
                    Console.Write("{0:f4} ", resultedMat[i, j]);
                }
                Console.WriteLine();
            }
            SumCheck(matrix);
        }
    }
}
