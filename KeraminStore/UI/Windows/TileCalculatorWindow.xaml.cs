using System;
using System.Windows;
using System.Windows.Controls;

namespace KeraminStore.UI.Windows
{
    public partial class TileCalculatorWindow : UserControl
    {
        public TileCalculatorWindow()
        {
            InitializeComponent();
        }

        private void CalculateButton_Click(object sender, RoutedEventArgs e) //Метод для расчета количества изделий
        {
            if (room.IsChecked == false && floor.IsChecked == false) //Проверка выбора площади работ
            {
                MessageBox.Show("Вы не выбрали площадь работ.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            double surfaceWidthValue = 0;
            if (surfaceWidth.Text == string.Empty) //Проверка ширины комнаты/пола
            {
                MessageBox.Show("Вы не указали ширину комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = double.TryParse(surfaceWidth.Text, out surfaceWidthValue);
                if (isNum)
                {
                    if (surfaceWidthValue <= 0)
                    {
                        MessageBox.Show("Ширина комнаты/пола не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в ширине комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
            double surfaceLenghtValue = 0;
            if (surfaceLenght.Text == string.Empty) //Проверка длины комнаты/пола
            {
                MessageBox.Show("Вы не указали длину комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = double.TryParse(surfaceLenght.Text, out surfaceLenghtValue);
                if (isNum)
                {
                    if (surfaceLenghtValue <= 0)
                    {
                        MessageBox.Show("Длина комнаты/пола не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в длине комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
            double surfaceArea = 0;
            double surfaceHeightValue = 0;
            if (room.IsChecked == true) 
            {
                if (surfaceHeight.Text == string.Empty) //Проверка высоты комнаты
                {
                    MessageBox.Show("Вы не указали высоту комнаты.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                else
                {
                    bool isNum = double.TryParse(surfaceHeight.Text, out surfaceHeightValue);
                    if (isNum)
                    {
                        if (surfaceHeightValue <= 0)
                        {
                            MessageBox.Show("Высота комнаты не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                            return;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Вы указали недопустимые символы в высоте комнаты.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                surfaceArea = (surfaceLenghtValue * 2 + surfaceWidthValue * 2) * surfaceHeightValue; //Расчет площади комнаты
            }
            else surfaceArea = surfaceLenghtValue * surfaceWidthValue; //Расчет площади комнаты/пола
            double tileWidthValue = 0;
            if (tileWidth.Text == string.Empty) //Проверка ширины плитки
            {
                MessageBox.Show("Вы не указали ширину плитки.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = double.TryParse(tileWidth.Text, out tileWidthValue);
                if (isNum)
                {
                    if (tileWidthValue <= 0)
                    {
                        MessageBox.Show("Ширина плитки не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в ширине плитки.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (tileWidthValue / 1000 > surfaceWidthValue)
                {
                    MessageBox.Show("Ширина плитки не может быть больше ширины комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
            double tileLenghtValue = 0;
            if (tileLenght.Text == string.Empty) //Проверка длины плитки
            {
                MessageBox.Show("Вы не указали длину плитки.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = double.TryParse(tileLenght.Text, out tileLenghtValue);
                if (isNum)
                {
                    if (tileLenghtValue <= 0)
                    {
                        MessageBox.Show("Длина плитки не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в длине плитки.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (tileLenghtValue / 1000 > surfaceLenghtValue)
                {
                    MessageBox.Show("Длина плитки не может быть больше длины комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
            double tileArea = (tileLenghtValue / 1000) * (tileWidthValue / 1000); //Расчет площади плитки
            int tileReserveValue = 0;
            if (tileReserve.Text == string.Empty) //Проверка запаса плитки
            {
                MessageBox.Show("Вы не указали запас плитки.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = int.TryParse(tileReserve.Text, out tileReserveValue);
                if (isNum)
                {
                    if (tileReserveValue < 0)
                    {
                        MessageBox.Show("Запас плитки не может быть отрицательным.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в запасе плитки.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
            surfaceArea -= double.Parse(area.Text);
            if (surfaceArea < tileArea)
            {
                MessageBox.Show("Площадь плитки не может быть больше площади комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                tileSquare.Text = surfaceArea.ToString("#.##");
                tileCount.Text = (Convert.ToInt32(surfaceArea / tileArea) + tileReserveValue).ToString();
            }
        }

        private void room_Click(object sender, RoutedEventArgs e)
        {
            surfaceHeight.Visibility = Visibility.Visible;
            areaHeight.Visibility = Visibility.Visible;
            AddArea.Margin = new Thickness(0, 129, 135, 0);
            ClearArea.Margin = new Thickness(125, 129, 0, 0);
            area.Margin = new Thickness(0, 288, 5, 0);
            UnlockString();
        }

        private void floor_Click(object sender, RoutedEventArgs e)
        {
            surfaceHeight.Visibility = Visibility.Hidden;
            areaHeight.Visibility = Visibility.Hidden;
            AddArea.Margin = new Thickness(15, 174, 150, 175);
            ClearArea.Margin = new Thickness(145, 174, 20, 174);
            area.Margin = new Thickness(15, 223, 20, 0);
            UnlockString();
        }

        private void AddArea_Click(object sender, RoutedEventArgs e) //Метод для вычисления площади не закладываемого участка
        {
            double surfaceWidthValue = 0;
            if (surfaceWidth.Text == string.Empty) //Проверка ширины комнаты/пола
            {
                MessageBox.Show("Вы не указали ширину комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = double.TryParse(surfaceWidth.Text, out surfaceWidthValue);
                if (isNum)
                {
                    if (surfaceWidthValue <= 0)
                    {
                        MessageBox.Show("Ширина комнаты/пола не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в ширине комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }

            double surfaceLenghtValue = 0;
            if (surfaceLenght.Text == string.Empty) //Проверка длины комнаты/пола
            {
                MessageBox.Show("Вы не указали длину комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = double.TryParse(surfaceLenght.Text, out surfaceLenghtValue);
                if (isNum)
                {
                    if (surfaceLenghtValue <= 0)
                    {
                        MessageBox.Show("Длина комнаты/пола не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в длине комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }

            double surfaceArea = 0;
            double surfaceHeightValue = 0;
            if (room.IsChecked == true)
            {
                if (surfaceHeight.Text == string.Empty) //Проверка высоты комнаты
                {
                    MessageBox.Show("Вы не указали высоту комнаты.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                else
                {
                    bool isNum = double.TryParse(surfaceHeight.Text, out surfaceHeightValue);
                    if (isNum)
                    {
                        if (surfaceHeightValue <= 0)
                        {
                            MessageBox.Show("Высота комнаты не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                            return;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Вы указали недопустимые символы в высоте комнаты.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                surfaceArea = (surfaceLenghtValue * 2 + surfaceWidthValue * 2) * surfaceHeightValue;
            }
            else surfaceArea = surfaceLenghtValue * surfaceWidthValue;

            double areaWidthValue = 0;
            if (areaWidth.Text == string.Empty) //Проверка ширины не закладываемого участка
            {
                MessageBox.Show("Вы не указали ширину не закладываемого участка.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = double.TryParse(areaWidth.Text, out areaWidthValue);
                if (isNum)
                {
                    if (areaWidthValue <= 0)
                    {
                        MessageBox.Show("Ширина не закладываемого участка не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в ширине не заклыдваемого участка.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (areaWidthValue > surfaceWidthValue)
                {
                    MessageBox.Show("Ширина не закладываемого участка не может быть больше ширины комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }

            double areaLenghtValue = 0;
            if (areaLenght.Text == string.Empty) //Проверка длины не закладываемого участка
            {
                MessageBox.Show("Вы не указали длину не закладываемого участка.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                bool isNum = double.TryParse(areaLenght.Text, out areaLenghtValue);
                if (isNum)
                {
                    if (areaLenghtValue <= 0)
                    {
                        MessageBox.Show("Длина не закладываемого участка не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в длине не заклыдваемого участка.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (areaLenghtValue > surfaceLenghtValue)
                {
                    MessageBox.Show("Длина не закладываемого участка не может быть больше длины комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }

            double areaArea = 0;
            double areaHeightValue = 0;
            if (room.IsChecked == true && areaHeight.Text != string.Empty)
            {
                bool isNum = double.TryParse(areaHeight.Text, out areaHeightValue);
                if (isNum) //Проверка высоты не закладываемого участка
                {
                    if (areaHeightValue <= 0)
                    {
                        MessageBox.Show("Высота не закладываемого участка не может быть отрицательной или равной нулю.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Вы указали недопустимые символы в высоте не заклыдваемого участка.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (areaHeightValue > surfaceHeightValue)
                {
                    MessageBox.Show("Высота не закладываемого участка не может быть больше высоты комнаты/пола.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                areaArea = (areaLenghtValue * 2 + areaWidthValue * 2) * areaHeightValue;
                if (surfaceArea < areaArea || surfaceArea < (areaArea + double.Parse(area.Text)))
                {
                    MessageBox.Show("Площадь не закладываемого участка не может быть больше площади комнаты.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                else area.Text = (double.Parse(area.Text) + areaArea).ToString();
            }
            else if (room.IsChecked == true && areaHeight.Text == string.Empty || floor.IsChecked == true)
            {
                areaArea = areaLenghtValue * areaWidthValue;
                if (surfaceArea < areaArea || surfaceArea < (areaArea + double.Parse(area.Text)))
                {
                    MessageBox.Show("Площадь не закладываемого участка не может быть больше площади комнаты.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                else area.Text = (double.Parse(area.Text) + areaArea).ToString("#.##");
            }
        }

        private void ClearArea_Click(object sender, RoutedEventArgs e)
        {
            area.Clear();
            area.Text = "0";
        }

        private void UnlockString() //Метод для предоставления доступа к полям
        {
            surfaceWidth.IsReadOnly = false;
            surfaceLenght.IsReadOnly = false;
            tileWidth.IsReadOnly = false;
            tileLenght.IsReadOnly = false;
            tileReserve.IsReadOnly = false;
            areaWidth.IsReadOnly = false;
            areaLenght.IsReadOnly = false;
            AddArea.IsEnabled = true;
            ClearArea.IsEnabled = true;
        }
    }
}