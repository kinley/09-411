using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AllSortings
{
    class MySortings
    {
        private int[] arrayToSort;

        public MySortings(int lengthOfArray)
        {
            Random rand = new Random();
            arrayToSort = new int[lengthOfArray];
            for (int i = 0; i < arrayToSort.Length; i++)
            {
                arrayToSort[i] = rand.Next(0, 100);
            }
            rand = null;
        }

        private void Swap(ref int a, ref int b) 
        {
            int temp = a;
            a = b;
            b = temp;
        }

        private void ShiftDown(ref int[] a, int i, int j)
        {
            int temp;
            int left = 2 * i + 1;
            int right = left + 1;
            int MaxChild = left;
            while (MaxChild < j)
            {
                if (right < j)
                {
                     if (a[left] < a[right])
                     {
                         MaxChild = right;
                     }
                }
                if (a[i] < a[MaxChild])
                {
                    temp = a[i];
                    a[i] = a[MaxChild];
                    a[MaxChild] = temp;
                }
                else
                {
                    break;
                }
                i = MaxChild;
                left = 2 * i + 1;
                right = left + 1;
                MaxChild = left;
            }
        }

        public void PrintArray()
        {
            for (int i = 0; i < arrayToSort.Length; i++)
            {
                Console.Write(" {0}", arrayToSort[i]);
            }
            Console.WriteLine();
        }

        public void BombbleSort()
        {
            bool sortAgain;
            do
            {
                sortAgain = false;
                for (int i = 0; i < arrayToSort.Length - 1; i++)
                {
                    if (arrayToSort[i] > arrayToSort[i + 1])
                    {
                        Swap(ref arrayToSort[i], ref arrayToSort[i + 1]);
                        sortAgain = true;
                    }
                }
            } while (sortAgain);
        }

        public void InstertSort()
        {
            for (int i = 1; i < arrayToSort.Length; i++)
            {
                int currentElement = arrayToSort[i];
                int prevKey = i - 1;

                while (prevKey >= 0 && arrayToSort[prevKey] > currentElement)
                {
                    arrayToSort[prevKey + 1] = arrayToSort[prevKey];
                    prevKey--;
                }
                arrayToSort[prevKey + 1] = currentElement;
            }
        }

        public void SelectionSort()
        {
            for (int i = 0; i < arrayToSort.Length - 1; i++)
            {
                int min = i;

                for (int j = i + 1; j < arrayToSort.Length; j++)
                {
                    if (arrayToSort[j] < arrayToSort[min])
                    {
                        min = j;
                    }
                }

                if (min != i)
                {
                    Swap(ref arrayToSort[i], ref arrayToSort[min]);
                }
            }
        }

        public void HeapSort()
        {
            int i;
            int temp;
            int len = arrayToSort.Length;
            for (i = len / 2 - 1; i >= 0; i--)
            {
                ShiftDown(ref arrayToSort, i, len);
            }
            for (i = len - 1; i > 0; i--)
            {
                temp = arrayToSort[0];
                arrayToSort[0] = arrayToSort[i];
                arrayToSort[i] = temp;
                ShiftDown(ref arrayToSort, 0, i);
            }
        }

        public void QuickSort(int first=0, int last=-1)
        {
            if (last == -1) 
            {
                last = arrayToSort.Length - 1;
            }

            int i = first;
            int j = last;
            int x = arrayToSort[(first + last) / 2];

            do
            {
                while (arrayToSort[i] < x && i < last) i++;
                while (arrayToSort[j] > x && j > first) j--;

                if (i <= j)
                {
                    if (i < j) Swap(ref arrayToSort[i], ref arrayToSort[j]);
                    i++;
                    j--;
                }
            } while (i <= j);

            if (i < last)
                QuickSort(i, last);
            if (first < j)
                QuickSort(first, j);
        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            MySortings sort = new MySortings(20);
            /*
             * В классе MySortings определено 5 сортировок.
             * Конструктор принимает единственный параметр: длина массива со псевдослучайными числами.
             * BumbleSort - сортировка пузырьком.
             * InstertSort - сортировка вставками.
             * SelectionSort - выбором, через минимальный элемент.
             * HeapSort - пирамидальная сортировка.
             * QuickSort - быстрая сортировка (рекурсия, ня).
             * Вывожу массив до и после сортировки через метод PrintArray().
             * Названия методов соответствует названиям сортировок, приведенным выше.
             * Пиииися.
             * ЗигХайль!
             * Хрен знает, как работает быстрая сортировка, списывал с какого-то рандомного сайта.
             * ОДНАКО РАБОТАЕТ.
             */
            sort.PrintArray();
            sort.HeapSort();
            sort.PrintArray();
            Console.ReadLine();
        }
    }
}
