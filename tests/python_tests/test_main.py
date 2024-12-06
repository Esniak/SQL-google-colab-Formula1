import unittest
from unittest.mock import patch, MagicMock
from src.main import main

class TestMain(unittest.TestCase):

    @patch('src.main.connect_to_database')
    @patch('src.main.plot_top_drivers')
    @patch('src.main.plot_race_distribution')
    def test_main_success(self, mock_plot_race_distribution, mock_plot_top_drivers, mock_connect_to_database):
        # Mock the database connection
        mock_connection = MagicMock()
        mock_cursor = MagicMock()
        mock_connect_to_database.return_value = mock_connection
        mock_connection.cursor.return_value = mock_cursor

        # Mock the cursor fetchall method
        mock_cursor.fetchall.side_effect = [
            [{'forename': 'Lewis', 'surname': 'Hamilton', 'total_points': 100}],
            [{'country': 'UK', 'total_races': 10}]
        ]

        # Call the main function
        main()

        # Assert the database connection was established
        mock_connect_to_database.assert_called_once()

        # Assert the queries were executed
        self.assertEqual(mock_cursor.execute.call_count, 2)

        # Assert the plots were created
        mock_plot_top_drivers.assert_called_once()
        mock_plot_race_distribution.assert_called_once()

    @patch('src.main.connect_to_database')
    def test_main_db_connection_failure(self, mock_connect_to_database):
        # Mock the database connection to return None
        mock_connect_to_database.return_value = None

        # Call the main function
        main()

        # Assert the database connection was attempted
        mock_connect_to_database.assert_called_once()

if __name__ == '__main__':
    unittest.main()
