
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clientes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `client_code` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `fullname` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Active, 2= Inactive',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client_list`
--

INSERT INTO `client_list` (`id`, `client_code`, `password`, `fullname`, `status`, `date_created`, `date_updated`) VALUES
(1, '20210001', 'a88df23ac492e6e2782df6586a0c645f', 'Cliente, Rafael Emilio', 1, '2021-11-05 13:12:15', '2021-11-07 12:47:05'),
(4, '20210002', '100af4e620024b40bbfc49214ea66509', 'Cliente, Pedro Juan', 1, '2021-11-05 14:59:58', '2021-11-07 12:38:53'),
(5, '20210003', '0a11a7db942d022cb1f771a93f0e8cb5', 'Cliente, Juan Alberto', 1, '2021-11-06 11:24:46', '2021-11-06 11:24:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_meta`
--

CREATE TABLE `client_meta` (
  `client_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client_meta`
--

INSERT INTO `client_meta` (`client_id`, `meta_field`, `meta_value`) VALUES
(5, 'lastname', 'Cliente'),
(5, 'firstname', 'Juan'),
(5, 'middlename', 'Alberto'),
(5, 'gender', 'Male'),
(5, 'dob', '1998-06-10'),
(5, 'contact', '3052584176'),
(5, 'address', 'Calle 87 N 21 23'),
(5, 'email', 'jcliente@cweb.com'),
(4, 'lastname', 'Cliente'),
(4, 'firstname', 'Pedro'),
(4, 'middlename', 'Juan'),
(4, 'gender', 'Male'),
(4, 'dob', '1997-10-14'),
(4, 'contact', '3059513478'),
(4, 'address', 'Calle 90 N 34 21'),
(4, 'email', 'pcliente@cweb.com'),
(1, 'lastname', 'Cliente'),
(1, 'firstname', 'Rafael'),
(1, 'middlename', 'Emilio'),
(1, 'gender', 'Male'),
(1, 'dob', '1997-06-23'),
(1, 'contact', '3062584714'),
(1, 'address', 'Av 34 N 23 212'),
(1, 'email', 'rcliente@cweb.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_list`
--

CREATE TABLE `invoice_list` (
  `id` int(30) NOT NULL,
  `invoice_code` varchar(50) NOT NULL,
  `client_id` int(30) NOT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=Paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `invoice_list`
--

INSERT INTO `invoice_list` (`id`, `invoice_code`, `client_id`, `total_amount`, `discount_perc`, `discount`, `tax_perc`, `tax`, `remarks`, `status`, `date_created`, `date_updated`) VALUES
(1, '202100001', 1, 592.9, 2, 12.1, 12, 72.6, 'Se aplica proceso de soporte posterior a las fases relacionadas', 1, '2021-11-05 13:12:43', '2021-11-07 15:38:51'),
(3, '202100002', 4, 717.24, 5, 37.7495, 12, 90.5988, 'Sample Invoice 2', 1, '2021-11-05 15:10:47', '2021-11-05 15:19:56'),
(4, '202100003', 5, 142.5, 5, 7.5, 0, 0, 'Se entrega la aplicación solicitada sin inconvenientes, se procede a realizar el cobro mencionado.', 1, '2021-11-06 11:32:31', '2021-11-06 11:34:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_services`
--

CREATE TABLE `invoice_services` (
  `invoice_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `invoice_services`
--

INSERT INTO `invoice_services` (`invoice_id`, `service_id`, `price`) VALUES
(2, 3, 355),
(2, 1, 250),
(2, 2, 399.99),
(3, 2, 399.99),
(3, 3, 355),
(4, 5, 150),
(1, 1, 250),
(1, 3, 355);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services_list`
--

CREATE TABLE `services_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `services_list`
--

INSERT INTO `services_list` (`id`, `name`, `description`, `price`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Desarrollo de Apliciones 2', 'Aplicaciones de segundo nivel, con más de 6 módulos en PHP y MySQL', 250, 1, '2021-11-05 09:48:30', '2021-11-07 15:34:36'),
(2, 'Desarrollo de Bases de Datos', 'Desarrollo de bases de datos, para la ejecución de aplicaciones del lado del cliente.', 150, 1, '2021-11-05 09:50:34', '2021-11-07 15:37:37'),
(3, 'Soporte Aplicaciones', 'Soporte de Aplicaciones Implementadas en nivel de la capa de presentanción del sistema', 100, 1, '2021-11-05 09:51:53', '2021-11-07 15:36:34'),
(5, 'Desarrollo de Aplicaciones Nivel 1', 'Se desarrollan aplicaciones principalmente en PHP y MySQL a medida de nivel 1', 150, 1, '2021-11-06 11:27:35', '2021-11-06 11:27:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Sistema de Gestión de Clientes en PHP y MySQL'),
(6, 'short_name', 'CRM - PHP y MySQL'),
(11, 'logo', 'uploads/logo-1636235879.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1636235199.png'),
(15, 'content', 'Array');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Mauricio', NULL, 'Sevilla', 'configuroweb', '4b67deeb9aba04a5b54632ad19934f26', 'uploads/avatar-1.png?v=1636319295', NULL, 1, '2021-01-20 14:02:37', '2021-11-07 16:08:15'),
(11, 'Nancy', NULL, 'Usuario', 'nusuaria', '4b67deeb9aba04a5b54632ad19934f26', 'uploads/avatar-11.png?v=1636318174', NULL, 2, '2021-11-03 14:22:46', '2021-11-07 15:49:34'),
(14, 'Samuel', NULL, 'Usuario', 'susuario', '4b67deeb9aba04a5b54632ad19934f26', 'uploads/avatar-14.png?v=1636318059', NULL, 2, '2021-11-05 09:01:18', '2021-11-07 15:47:39'),
(15, 'Juan', NULL, 'Usuario', 'jusuario', '4b67deeb9aba04a5b54632ad19934f26', 'uploads/avatar-15.png?v=1636216109', NULL, 2, '2021-11-06 11:28:29', '2021-11-06 11:30:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_meta`
--

CREATE TABLE `user_meta` (
  `user_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `client_meta`
--
ALTER TABLE `client_meta`
  ADD KEY `client_id` (`client_id`);

--
-- Indices de la tabla `invoice_list`
--
ALTER TABLE `invoice_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indices de la tabla `invoice_services`
--
ALTER TABLE `invoice_services`
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indices de la tabla `services_list`
--
ALTER TABLE `services_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_meta`
--
ALTER TABLE `user_meta`
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `invoice_list`
--
ALTER TABLE `invoice_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `services_list`
--
ALTER TABLE `services_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `client_meta`
--
ALTER TABLE `client_meta`
  ADD CONSTRAINT `client_meta_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
