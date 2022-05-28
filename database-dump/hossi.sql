-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2022 at 09:51 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hossi`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `diagnosis_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `diagnosis_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `case_priority` varchar(10) NOT NULL DEFAULT 'MEDIUM'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`diagnosis_id`, `patient_id`, `diagnosis_date`, `description`, `doctor_id`, `case_priority`) VALUES
(2, 1, '2022-05-28 17:22:01', 'has cold-flu , mild symptoms -gave 1 dose of metroplithm injection and 10 painkillers', 5, 'LOW');

-- --------------------------------------------------------

--
-- Table structure for table `patient_refferals`
--

CREATE TABLE `patient_refferals` (
  `referal_id` int(11) NOT NULL,
  `diagnosis_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `hospital_reffered_email` varchar(56) NOT NULL,
  `case_priority` varchar(10) NOT NULL DEFAULT 'EMERGENCY',
  `hospital_name` varchar(230) NOT NULL,
  `hospital_address` varchar(230) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_refferals`
--

INSERT INTO `patient_refferals` (`referal_id`, `diagnosis_id`, `patient_id`, `hospital_reffered_email`, `case_priority`, `hospital_name`, `hospital_address`, `date`, `description`) VALUES
(1, 1, 1, 'knh@knh.go.ke', 'HIGH', 'KNH Hospital', 'Nairobi', '2022-05-28 18:44:27', 'our hospital is full and patient requires urgent service');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `full_names` varchar(280) NOT NULL,
  `username` varchar(56) NOT NULL,
  `password` varchar(700) NOT NULL,
  `date_of_birth` varchar(12) NOT NULL,
  `tel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `full_names`, `username`, `password`, `date_of_birth`, `tel`) VALUES
(1, 'doctor', 'John Doctor', 'doctor@doctor.com', 'doctor', '1974-09-01', '0111808341'),
(2, 'patient', 'Jane Patient', 'patient@patient.com', 'patient', '2000-01-01', '999'),
(4, 'patient', 'Joan doe ', 'admin@webninjaafrica.com', 'admin', '2022-05-02', '+254111560417');

-- --------------------------------------------------------

--
-- Table structure for table `ward_admissions`
--

CREATE TABLE `ward_admissions` (
  `transaction_id` int(11) NOT NULL,
  `ward_name` varchar(30) NOT NULL,
  `bed_number` varchar(5) NOT NULL,
  `day_in` varchar(12) NOT NULL,
  `expected_day_out` text NOT NULL,
  `has_checked_out` varchar(10) NOT NULL DEFAULT 'NOT-YET',
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ward_admissions`
--

INSERT INTO `ward_admissions` (`transaction_id`, `ward_name`, `bed_number`, `day_in`, `expected_day_out`, `has_checked_out`, `patient_id`) VALUES
(1, 'ward #1', '1', '2022-05-28', '2022-05-30', 'NOT-YET', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`diagnosis_id`);

--
-- Indexes for table `patient_refferals`
--
ALTER TABLE `patient_refferals`
  ADD PRIMARY KEY (`referal_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `ward_admissions`
--
ALTER TABLE `ward_admissions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `diagnosis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_refferals`
--
ALTER TABLE `patient_refferals`
  MODIFY `referal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ward_admissions`
--
ALTER TABLE `ward_admissions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
