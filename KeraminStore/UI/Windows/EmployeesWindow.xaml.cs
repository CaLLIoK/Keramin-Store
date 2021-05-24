﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Windows;
using System.Windows.Controls;

namespace KeraminStore.UI.Windows
{
    public partial class EmployeesWindow : UserControl
    {
        readonly SqlConnection connectionString = new SqlConnection(@"Data Source=(local)\SQLEXPRESS; Initial Catalog=KeraminStore; Integrated Security=True");

        public EmployeesWindow()
        {
            InitializeComponent();

            connectionString.Open();
            FillDataGrid();
            connectionString.Close();
        }

        private void FillDataGrid()
        {
            StreamReader file = new StreamReader("UserCode.txt");
            int userCode = Convert.ToInt32(file.ReadLine());
            file.Close();

            string employeesInfoQuery = "SELECT CONCAT(employeeSurname, ' ', employeeName, ' ', employeePatronymic) as 'employeeInfo', employeeSurname, employeeName, employeePatronymic, employeeLogin, employeePassword, employeeDateOfBirth, postName " +
                                         "FROM Employee " +
                                         "JOIN Post ON Employee.postCode = Post.postCode WHERE employeeCode != '" + userCode + "'";

            DataTable table = new DataTable();
            using (SqlCommand cmd = new SqlCommand(employeesInfoQuery, connectionString))
            {
                using (IDataReader rdr = cmd.ExecuteReader())
                {
                    table.Load(rdr);
                }
            }
            EmployeesInfoGrid.ItemsSource = table.DefaultView;
        }

        private void ChangeButton_Click(object sender, RoutedEventArgs e)
        {
            if (EmployeesInfoGrid.SelectedItem == null)
            {
                MessageBox.Show("Невозможно изменить информацию о сотруднике, так как он не был выбран.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                DataRowView employeeInfo = (DataRowView)EmployeesInfoGrid.SelectedItems[0];
                ChangeEmployeeInfoWindow changeEmployeeInfo = new ChangeEmployeeInfoWindow();
                string selectEmployeeInfoQuery = "SELECT employeeCode FROM Employee WHERE employeeLogin = '" + employeeInfo["employeeLogin"].ToString() + "'";
                using (SqlDataAdapter dataAdapter = new SqlDataAdapter(selectEmployeeInfoQuery, connectionString))
                {
                    DataTable table = new DataTable();
                    dataAdapter.Fill(table);
                    if (table.Rows.Count > 0)
                    {
                        StreamWriter employeeCode = new StreamWriter("ChangingEmployee.txt");
                        employeeCode.Write(table.Rows[0]["employeeCode"].ToString());
                        employeeCode.Close();
                    }
                }
                changeEmployeeInfo.loginField.Text = employeeInfo["employeeLogin"].ToString();
                changeEmployeeInfo.passwordField.Text = employeeInfo["employeePassword"].ToString();
                changeEmployeeInfo.nameField.Text = employeeInfo["employeeName"].ToString();
                changeEmployeeInfo.surnameField.Text = employeeInfo["employeeSurname"].ToString();
                changeEmployeeInfo.patronymicField.Text = employeeInfo["employeePatronymic"].ToString();
                changeEmployeeInfo.birthdayDateField.Text = employeeInfo["employeeDateOfBirth"].ToString();
                changeEmployeeInfo.postField.Text = employeeInfo["postName"].ToString();
                changeEmployeeInfo.ShowDialog();
                EmployeesInfoGrid.ItemsSource = null;
                EmployeesInfoGrid.Items.Refresh();
                connectionString.Open();
                FillDataGrid();
                connectionString.Close();
            }
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (EmployeesInfoGrid.SelectedItem == null) //Проверка выбора сотрудника, который будет удален
            {
                MessageBox.Show("Невозможно удалить информацию о сотруднике, так как он не был выбран.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                DataRowView employeeInfo = (DataRowView)EmployeesInfoGrid.SelectedItems[0]; //Получание информации о сотруднике из таблицы
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "DELETE FROM Employee WHERE employeeLogin = @login"; //Запрос на удаление выбранного сотрудника
                cmd.Parameters.Add("@login", SqlDbType.VarChar).Value = employeeInfo["employeeLogin"].ToString();
                cmd.Connection = connectionString;
                connectionString.Open();
                cmd.ExecuteNonQuery();
                FillDataGrid();
                connectionString.Close();
                MessageBox.Show("Удаление успешно выполнено.", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}