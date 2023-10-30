-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 30, 2023 at 12:13 PM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cmdtable`
--

CREATE TABLE IF NOT EXISTS `cmdtable` (
  `id` int(6) NOT NULL,
  `category` varchar(30) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `execution` varchar(500) NOT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cmdtable`
--

INSERT INTO `cmdtable` (`id`, `category`, `description`, `execution`, `image`) VALUES
(1, 'Permission', 'How to assign permission to folder and files. In this example, the filename is owned by user:dmt and group: dmt', 'chown -R dmt:dmt <filename>', ''),
(2, 'Permission', 'How to add user: dmt to a docker group', 'usermod -aG docker dmt', 'Screenshot 2023-10-28 220541.png'),
(4, 'SSH', 'Copy public rsa key from control server to node servers ', 'ssh-copy-id ctp@10.29.92.120', ''),
(6, 'Docker', 'List all docker containers (Running and non-running ones)', 'docker ps -a', ''),
(8, 'Docker', 'List all docker containers (Only running ones)', 'docker ps', ''),
(9, 'Docker', 'List all docker images', 'docker images', ''),
(10, 'Docker', 'Pull images from Docker repository', 'docker pull <imagename>', ''),
(15, 'Docker', 'Run a new docker container from image', 'docker run -d --name mynginx nginx', 'Screenshot 2023-10-28 130921.png'),
(16, 'Docker', 'How to build a docker image from a folder with the dockerfile in it. First, cd into the folder, then run the docker build command', 'docker build --no-cache -t my-isvparser .', 'Screenshot 2023-10-28 221558.png'),
(17, 'Docker', 'How to start an existing docker container', 'docker start -d <containerid>', ''),
(18, 'Docker', 'How to stop a running docker container', 'docker stop <containerid>', ''),
(21, 'Permission', 'Set ''executable'' permission for all users for a specific file', 'chmod a+x <filename>', 'Screenshot 2023-10-28 223036.png'),
(22, 'Permission', 'Sets permissions so that, (U)ser / owner can read, can write and can execute. (G)roup can read, can write and can execute. (O)thers can read, can write and can execute.', 'chmod 777 <filename>', 'Screenshot 2023-10-28 220938.png'),
(23, 'Python', 'Create a virtual environment for Python in Linux. venv_flask refers to the name of the virtual environment', 'python3 -m venv venv_flask', ''),
(24, 'Python', 'Enter/ activate your Python virtual environment (Linux)', 'source venv_flask/bin/activate', ''),
(25, 'Directory', 'MySQL default directory', '/var/lib/sql', ''),
(26, 'Docker', 'How to inspect a docker image or container', 'docker inspect <containerid>', ''),
(27, 'Linux', 'List all the users in the system', 'cat /etc/passwd', ''),
(28, 'Linux', 'List all groups in the system', 'cat /etc/group', ''),
(29, 'Directory', 'Docker default directory ', '/var/lib/docker', ''),
(30, 'SSH', 'How to create a SSH key-pair. Lock and key analogy', 'ssh-keygen', 'Screenshot 2023-10-28 221331.png'),
(31, 'Directory', 'Jenkins default directory', '/var/lib/jenkins', ''),
(49, 'Linux', 'How to enable password-based authenticated (for eg, on an AWS EC2 instance)', 'vi /etc/ssh/sshd_config;\r\nuncomment PasswordAuthentication yes; \r\nservice sshd reload', 'Screenshot 2023-10-29 234533.png'),
(51, 'Flask', 'Sample Flask Template', 'Refer to attached image', 'Screenshot 2023-10-28 230004.png'),
(52, 'Ansible', 'Sample ansible playbook template', 'See attached image', 'Ansible.png'),
(53, 'Docker', 'How to start up a docker compose in detached mode and rebuild the image', 'docker-compose up -d --build', 'Screenshot 2023-10-29 233539.png'),
(54, 'Docker', 'How to start up a docker compose if using non-standard docker-compose.yaml file name, eg mongo.yaml', 'docker-compose -f mongo.yaml up', 'Screenshot 2023-10-29 233812.png'),
(55, 'Devops', 'What is Devops?', 'DevOps is a set of practices, principles, and cultural philosophies that aim to enhance collaboration and communication between software development (Dev) and IT operations (Ops) teams. The primary goal of DevOps is to improve the efficiency and quality of software delivery by breaking down silos, fostering a culture of collaboration, and automating processes.', 'Devops.gif'),
(56, 'Devops', 'What is Continuous Integration/Continuous Deployment (CI/CD)', 'Automating the build, test, and deployment processes to enable faster and more reliable software delivery?', ''),
(57, 'Docker', 'Command to start a nginx container with name: myweb and forward port 7090 on host to port 80 of nginx in container ', 'docker run --name myweb -p 7090:80 -d nginx', 'FireShot Capture 003 - Multiple Image Upload Enhancement - chat.openai.com.png'),
(58, 'Docker', 'Containers run using images like Ubuntu will exit immediately upon started. To keep it alive after starting it, run with this command', 'docker run -d ubuntu sleep 1000', 'Screenshot 2023-10-29 235746.png'),
(59, 'Docker', 'How to delete all stopped containers', 'docker container prune', ''),
(60, 'Docker', 'How to delete all unused images', 'docker image prune', ''),
(61, 'Linux', 'Network: Check which port httpd uses', 'netstat -tulpn | grep httpd', 'Screenshot 2023-10-30 000313.png'),
(62, 'Permission', 'How to grant members of the ''wheel'' group full sudo privileges without requiring a password?', 'visudo; %wheel ALL=(ALL) NO PASSWD=ALL', 'Screenshot 2023-10-30 000849.png'),
(63, 'Flask', 'What is the meaning of -> if __name__=''__main__":', 'See attached image', 'FireShot Capture 001 - Multiple Image Upload Enhancement - chat.openai.com.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cmdtable`
--
ALTER TABLE `cmdtable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cmdtable`
--
ALTER TABLE `cmdtable`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
