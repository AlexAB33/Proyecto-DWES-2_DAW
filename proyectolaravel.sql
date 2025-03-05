-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2025 a las 12:00:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectolaravel`
--
CREATE DATABASE IF NOT EXISTS `proyectolaravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyectolaravel`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

DROP TABLE IF EXISTS `anuncios`;
CREATE TABLE `anuncios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo` enum('compra','venta') DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `anuncios`
--

INSERT INTO `anuncios` (`id`, `titulo`, `descripcion`, `precio`, `email`, `telefono`, `fecha_publicacion`, `fecha_actualizacion`, `created_at`, `updated_at`, `tipo`, `user_id`) VALUES
(1, 'iPhone 14 Pro Max', 'Vendo iPhone 14 Pro Max en perfecto estado, solo 3 meses de uso. Color negro espacial, 256GB. Incluye cargador y caja original.', 999.99, 'juan@gmail.com', '666111222', '2025-03-05 10:59:52', NULL, '2025-02-20 02:58:45', '2025-02-20 03:30:45', 'venta', 1),
(2, 'Busco profesor de matemáticas', 'Necesito profesor particular para matemáticas nivel bachillerato. 2 horas semanales.', 15.00, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-10 02:57:45', '2025-02-10 03:05:45', 'compra', 2),
(3, 'Bicicleta montaña Trek', 'Vendo bicicleta Trek Marlin 7 2023. Talla M. Poco uso, como nueva.', 650.00, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-15 21:03:45', '2025-02-15 21:08:45', 'venta', 3),
(4, 'PS5 nueva sin estrenar', 'PlayStation 5 nueva, versión con lector, precintada. Incluye un mando adicional.', 549.99, 'ana@gmail.com', '666777888', '2025-03-05 10:59:52', NULL, '2025-02-14 13:39:45', '2025-02-14 13:41:45', 'venta', 4),
(5, 'Clases de inglés online', 'Profesora nativa imparte clases de inglés todos los niveles. Preparación exámenes oficiales.', NULL, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-23 16:21:45', '2025-02-23 17:14:45', NULL, 2),
(6, 'Compro cómics Marvel', 'Interesado en comprar cómics de Marvel en buen estado. Pago bien.', NULL, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-12 05:58:45', '2025-02-12 06:18:45', 'compra', 3),
(7, 'MacBook Pro M2', 'Vendo MacBook Pro M2 2023, 16GB RAM, 512GB SSD. Apenas 2 meses de uso.', 1499.99, 'juan@gmail.com', '666111222', '2025-03-05 10:59:52', NULL, '2025-02-13 19:03:45', '2025-02-13 19:06:45', 'venta', 1),
(8, 'Se busca guitarrista', 'Banda de rock busca guitarrista para proyecto serio. Influencias: Led Zeppelin, Pink Floyd.', NULL, 'ana@gmail.com', '666777888', '2025-03-05 10:59:52', NULL, '2025-03-02 20:32:45', '2025-03-02 20:47:45', NULL, 4),
(9, 'Nintendo Switch OLED', 'Vendo Nintendo Switch modelo OLED blanca. Incluye 3 juegos y funda.', 299.99, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-18 09:45:45', '2025-02-18 09:50:45', 'venta', 3),
(10, 'Alquilo plaza de garaje', 'Plaza de garaje en el centro. Fácil acceso, vigilancia 24h.', 80.00, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-22 20:23:45', '2025-02-22 21:05:45', 'venta', 2),
(11, 'Monitor Gaming 144Hz', 'Monitor gaming ASUS 27 pulgadas, 144Hz, 1ms, FreeSync. Como nuevo, en garantía.', 249.99, 'juan@gmail.com', '666111222', '2025-03-05 10:59:52', NULL, '2025-02-27 12:55:45', '2025-02-27 13:11:45', 'venta', 1),
(12, 'Busco piso compartido', 'Estudiante busca habitación en piso compartido cerca de la universidad. Máximo 350€/mes.', 350.00, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-09 22:39:45', '2025-02-09 22:53:45', 'compra', 2),
(13, 'Clases de guitarra', 'Profesor con 15 años de experiencia. Todos los niveles y estilos. Primera clase gratis.', 20.00, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-20 13:43:45', '2025-02-20 14:06:45', NULL, 3),
(14, 'Colección Manga Naruto', 'Vendo colección completa de Naruto, 72 tomos. Perfecto estado.', 280.00, 'ana@gmail.com', '666777888', '2025-03-05 10:59:52', NULL, '2025-02-09 10:51:45', '2025-02-09 11:06:45', 'venta', 4),
(15, 'Cámara Canon EOS R6', 'Vendo cámara mirrorless Canon EOS R6. Incluye objetivo 24-105mm.', 1899.99, 'juan@gmail.com', '666111222', '2025-03-05 10:59:52', NULL, '2025-02-13 04:19:45', '2025-02-13 04:23:45', 'venta', 1),
(16, 'Busco entrenador personal', 'Busco entrenador personal para preparación maratón. 3 sesiones semanales.', NULL, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-04 04:15:45', '2025-02-04 04:51:45', 'compra', 2),
(17, 'iPad Pro 2023', 'iPad Pro 12.9 M2, 256GB, WiFi+Cellular. Incluye Apple Pencil 2.', 1099.99, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-07 19:31:45', '2025-02-07 20:20:45', 'venta', 3),
(18, 'Servicio de jardinería', 'Jardinero profesional ofrece servicios de mantenimiento y diseño de jardines.', NULL, 'ana@gmail.com', '666777888', '2025-03-05 10:59:52', NULL, '2025-02-23 02:03:45', '2025-02-23 02:21:45', NULL, 4),
(19, 'Volkswagen Golf GTI', 'Golf GTI 2020, 45.000km, libro mantenimiento. Perfecto estado.', 28500.00, 'juan@gmail.com', '666111222', '2025-03-05 10:59:52', NULL, '2025-03-01 12:58:45', '2025-03-01 13:01:45', 'venta', 1),
(20, 'Busco profesor programación', 'Necesito clases particulares de Python y JavaScript. Nivel principiante.', 20.00, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-15 00:54:45', '2025-02-15 01:16:45', 'compra', 2),
(21, 'Roomba i7+', 'Robot aspirador con base autovaciable. 6 meses de uso, como nuevo.', 499.99, 'ana@gmail.com', '666777888', '2025-03-05 10:59:52', NULL, '2025-02-13 04:50:45', '2025-02-13 05:33:45', 'venta', 4),
(22, 'Saxofón Alto Yamaha', 'Saxofón profesional YAS-480, con estuche y accesorios.', 1200.00, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-15 12:39:45', '2025-02-15 13:06:45', 'venta', 3),
(23, 'Busco profesor AutoCAD', 'Necesito clases particulares de AutoCAD y Revit. Urgente.', 25.00, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-07 07:01:45', '2025-02-07 07:09:45', 'compra', 2),
(24, 'Colección vinilos jazz', 'Más de 100 vinilos de jazz clásico. Excelente estado.', 850.00, 'juan@gmail.com', '666111222', '2025-03-05 10:59:52', NULL, '2025-02-12 16:19:45', '2025-02-12 16:40:45', 'venta', 1),
(25, 'Patinete eléctrico Xiaomi', 'Modelo Pro 2, apenas usado. Incluye seguro vigente.', 350.00, 'ana@gmail.com', '666777888', '2025-03-05 10:59:52', NULL, '2025-02-11 22:49:45', '2025-02-11 23:08:45', 'venta', 4),
(26, 'Traducciones inglés-español', 'Traductora oficial. Documentos, textos técnicos, web.', NULL, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-18 10:18:45', '2025-02-18 10:52:45', NULL, 2),
(27, 'DJI Mini 3 Pro', 'Dron con cámara 4K, dos baterías y control remoto.', 750.00, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-17 17:18:45', '2025-02-17 18:09:45', 'venta', 3),
(28, 'Busco violín antiguo', 'Coleccionista busca violín anterior a 1950. Pago bien.', NULL, 'juan@gmail.com', '666111222', '2025-03-05 10:59:52', NULL, '2025-02-05 22:48:45', '2025-02-05 23:25:45', 'compra', 1),
(29, 'Impresora 3D Prusa', 'Prusa i3 MK3S+. Poco uso, calibrada y actualizada.', 650.00, 'ana@gmail.com', '666777888', '2025-03-05 10:59:52', NULL, '2025-03-02 04:19:45', '2025-03-02 04:50:45', 'venta', 4),
(30, 'Alquilo estudio fotografía', 'Estudio equipado por horas. Flashes Profoto incluidos.', 30.00, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-06 13:26:45', '2025-02-06 14:10:45', 'venta', 3),
(31, 'Mesa ping pong profesional', 'Mesa Butterfly, plegable, con red y accesorios.', 450.00, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-03 17:25:45', '2025-02-03 17:35:45', 'venta', 2),
(32, 'Busco profesor piano', 'Para niño de 8 años. Preferible a domicilio.', 25.00, 'juan@gmail.com', '666111222', '2025-03-05 10:59:52', NULL, '2025-02-22 11:03:45', '2025-02-22 11:39:45', 'compra', 1),
(33, 'iMac 27\" 2023', 'iMac último modelo, 16GB RAM, 1TB. En garantía.', 1899.99, 'ana@gmail.com', '666777888', '2025-03-05 10:59:52', NULL, '2025-02-11 17:13:45', '2025-02-11 17:45:45', 'venta', 4),
(34, 'Curso fotografía grupal', 'Curso intensivo fin de semana. Teoría y práctica.', 150.00, 'pedro@gmail.com', '666555666', '2025-03-05 10:59:52', NULL, '2025-02-14 17:09:45', '2025-02-14 18:00:45', NULL, 3),
(35, 'Bicicleta eléctrica Orbea', 'Modelo Rise M20, como nueva. 500km de uso.', 3500.00, 'maria@gmail.com', '666333444', '2025-03-05 10:59:52', NULL, '2025-02-06 01:18:45', '2025-02-06 01:58:45', 'venta', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_pepe@gmail.com|127.0.0.1', 'i:1;', 1741012522),
('laravel_cache_pepe@gmail.com|127.0.0.1:timer', 'i:1741012522;', 1741012522);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `anuncio_id` bigint(20) UNSIGNED NOT NULL,
  `contenido` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `user_id`, `anuncio_id`, `contenido`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '¿Aceptas intercambios por un iPhone 13 Pro + diferencia?', '2025-02-20 19:35:54', '2025-02-20 19:59:54'),
(2, 3, 2, '¿Qué horarios tienes disponibles para las clases?', '2025-03-05 05:31:54', '2025-03-05 05:52:54'),
(3, 1, 3, '¿La bicicleta tiene garantía todavía?', '2025-02-24 06:03:54', '2025-02-24 06:38:54'),
(4, 2, 4, '¿Harías envío a Barcelona?', '2025-03-02 05:57:54', '2025-03-02 06:49:54'),
(5, 4, 5, '¿Das clases los fines de semana?', '2025-03-01 23:47:54', '2025-03-02 00:22:54'),
(6, 1, 6, 'Tengo varios números de Spiderman de los años 90', '2025-02-25 22:16:54', '2025-02-25 22:36:54'),
(7, 3, 7, '¿Tiene AppleCare+?', '2025-02-22 01:15:54', '2025-02-22 02:11:54'),
(9, 4, 9, '¿Los juegos son físicos o digitales?', '2025-03-03 08:48:54', '2025-03-03 09:21:54'),
(10, 1, 10, '¿Es una plaza grande? ¿Cabe un SUV?', '2025-02-18 13:14:54', '2025-02-18 13:59:54'),
(11, 3, 1, 'Me interesa, ¿podemos quedar para verlo?', '2025-02-28 05:01:54', '2025-02-28 05:08:54'),
(12, 4, 2, '¿Tienes experiencia con alumnos de bachillerato?', '2025-03-04 22:37:54', '2025-03-04 22:59:54'),
(13, 2, 3, '¿Cuál es el último precio?', '2025-03-03 12:16:54', '2025-03-03 12:44:54'),
(14, 1, 4, '¿Aceptas PayPal como método de pago?', '2025-03-03 06:43:54', '2025-03-03 06:59:54'),
(15, 3, 5, '¿Qué nivel de inglés tienes certificado?', '2025-02-22 08:59:54', '2025-02-22 09:53:54'),
(16, 3, 11, '¿Tiene HDR el monitor?', '2025-03-01 15:58:54', '2025-03-01 16:43:54'),
(17, 1, 12, '¿La zona tiene buena conexión de metro?', '2025-02-21 20:06:54', '2025-02-21 20:07:54'),
(18, 4, 13, '¿Das clases online también?', '2025-03-03 17:51:54', '2025-03-03 18:44:54'),
(19, 2, 14, '¿Venderías tomos sueltos?', '2025-02-27 19:12:54', '2025-02-27 19:34:54'),
(20, 3, 15, '¿Cuántos disparos tiene?', '2025-02-27 04:38:54', '2025-02-27 04:47:54'),
(21, 1, 16, '¿Qué experiencia tienes con maratonianos?', '2025-02-19 02:48:54', '2025-02-19 03:29:54'),
(22, 4, 17, '¿Incluye funda original?', '2025-02-22 17:19:54', '2025-02-22 17:19:54'),
(23, 2, 18, '¿Haces presupuesto sin compromiso?', '2025-02-22 16:24:54', '2025-02-22 17:22:54'),
(24, 3, 19, '¿Tiene garantía oficial VW todavía?', '2025-03-02 19:19:54', '2025-03-02 20:09:54'),
(25, 1, 20, '¿Horarios flexibles para las clases?', '2025-02-21 11:34:54', '2025-02-21 11:51:54'),
(26, 2, 11, '¿Sigues teniendo el monitor?', '2025-02-27 14:07:54', '2025-02-27 15:03:54'),
(27, 4, 12, '¿Podría ver el piso este fin de semana?', '2025-02-26 00:07:54', '2025-02-26 00:54:54'),
(28, 1, 13, 'Precio por mes de clases?', '2025-02-27 22:27:54', '2025-02-27 22:36:54'),
(29, 3, 14, '¿Los tomos están precintados?', '2025-03-01 03:08:54', '2025-03-01 03:32:54'),
(30, 4, 15, '¿Aceptas cambio por Sony A7III?', '2025-02-25 09:31:54', '2025-02-25 10:05:54'),
(31, 2, 16, 'Me interesa el servicio, ¿precio por sesión?', '2025-02-19 02:24:54', '2025-02-19 03:04:54'),
(32, 1, 17, '¿Es el modelo con 5G?', '2025-03-04 19:40:54', '2025-03-04 20:17:54'),
(33, 3, 18, '¿Trabajas también con plantas de interior?', '2025-03-03 09:24:54', '2025-03-03 09:28:54'),
(34, 4, 19, '¿Cuántos propietarios anteriores?', '2025-02-19 23:13:54', '2025-02-19 23:44:54'),
(35, 2, 20, '¿Tienes experiencia con frameworks?', '2025-02-20 06:06:54', '2025-02-20 06:30:54'),
(36, 1, 21, '¿Compatible con Alexa?', '2025-02-22 22:06:54', '2025-02-22 22:34:54'),
(37, 2, 22, '¿Tiene todas las zapatillas originales?', '2025-02-20 11:23:54', '2025-02-20 11:30:54'),
(38, 3, 23, '¿Das clases online?', '2025-03-04 02:52:54', '2025-03-04 03:05:54'),
(39, 4, 24, '¿Tienes lista de los vinilos?', '2025-02-18 19:23:54', '2025-02-18 20:08:54'),
(40, 1, 25, '¿Kilómetros totales?', '2025-02-25 03:35:54', '2025-02-25 03:40:54'),
(41, 2, 26, '¿Precio por palabra?', '2025-02-19 18:57:54', '2025-02-19 19:10:54'),
(42, 3, 27, '¿Tiene seguro contra pérdidas?', '2025-02-23 04:14:54', '2025-02-23 05:03:54'),
(43, 4, 28, 'Tengo uno de 1940, ¿interesado?', '2025-02-20 01:32:54', '2025-02-20 01:57:54'),
(44, 1, 29, '¿Qué filamentos has usado?', '2025-03-01 08:14:54', '2025-03-01 08:56:54'),
(45, 2, 30, '¿Disponible en fin de semana?', '2025-02-20 01:47:54', '2025-02-20 01:59:54'),
(46, 3, 31, '¿Es para exterior?', '2025-02-25 00:25:54', '2025-02-25 01:20:54'),
(47, 4, 32, '¿Experiencia con niños?', '2025-03-02 08:56:54', '2025-03-02 09:54:54'),
(48, 1, 33, '¿Tiene AppleCare+?', '2025-02-27 08:41:54', '2025-02-27 08:48:54'),
(49, 2, 34, '¿Incluye equipo fotográfico?', '2025-02-27 04:50:54', '2025-02-27 05:29:54'),
(50, 3, 35, '¿Autonomía real?', '2025-02-18 12:20:54', '2025-02-18 13:18:54'),
(51, 4, 21, '¿La base funciona bien?', '2025-02-27 10:23:54', '2025-02-27 11:13:54'),
(52, 1, 22, '¿Último precio?', '2025-03-02 06:11:54', '2025-03-02 06:31:54'),
(53, 2, 23, '¿Horarios disponibles?', '2025-02-18 13:59:54', '2025-02-18 14:06:54'),
(54, 3, 24, '¿Vendes por separado?', '2025-03-02 15:33:54', '2025-03-02 16:11:54'),
(55, 4, 25, '¿Tiene bloqueo por app?', '2025-02-20 01:02:54', '2025-02-20 01:51:54'),
(56, 1, 26, '¿Haces traducciones juradas?', '2025-02-18 19:47:54', '2025-02-18 19:57:54'),
(57, 2, 27, '¿Incluye curso básico?', '2025-03-02 13:59:54', '2025-03-02 14:25:54'),
(58, 3, 28, '¿Precio máximo a pagar?', '2025-02-20 01:49:54', '2025-02-20 02:26:54'),
(59, 4, 29, '¿Envías a otras provincias?', '2025-02-19 04:22:54', '2025-02-19 05:13:54'),
(60, 1, 30, '¿Equipo de iluminación completo?', '2025-03-03 02:37:54', '2025-03-03 03:02:54'),
(61, 2, 31, '¿Dimensiones plegada?', '2025-02-20 13:13:54', '2025-02-20 13:42:54'),
(62, 3, 32, '¿Tienes piano propio?', '2025-02-23 02:27:54', '2025-02-23 02:41:54'),
(63, 4, 33, '¿Se puede probar antes?', '2025-02-20 04:48:54', '2025-02-20 05:28:54'),
(64, 1, 34, '¿Nivel mínimo requerido?', '2025-02-24 10:54:54', '2025-02-24 11:36:54'),
(65, 2, 35, '¿Garantía de la batería?', '2025-03-05 05:20:54', '2025-03-05 05:47:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '0001_01_01_000000_create_users_table', 1),
(9, '0001_01_01_000001_create_cache_table', 1),
(10, '0001_01_01_000002_create_jobs_table', 1),
(11, '2025_03_01_153045_create_anuncios_table', 1),
(12, '2025_03_01_153045_create_likes_table', 1),
(13, '2025_03_01_153046_create_comentarios_table', 1),
(14, '2025_03_01_153048_add_admin_to_users_table', 1),
(15, '2025_03_01_184402_crear_anuncios', 2),
(16, '2025_03_01_184850_crear_likes', 2),
(17, '2025_03_01_184914_crear_comentarios', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ayJHbygGszeeReVw8LD32A7Y3nWNa4813S667J6w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/0.46.8 Chrome/128.0.6613.186 Electron/32.2.6 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkY0ZHpYemxGM0NtbHFGckpxYkVLakdIQjJIRGQ4aEhwRHZqbG43TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/dnNjb2RlQnJvd3NlclJlcUlkPTE3NDExNzAwOTkwNjgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1741170099),
('dnn58hxVnH8WGjwiIENIYJlxRtDs4ayDFsYGNok2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Cursor/0.46.8 Chrome/128.0.6613.186 Electron/32.2.6 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnJFbnEyNFkzVnJWYTdhelVzNTRrU2hDTTdENlFQUk5IWXdlaW55YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/dnNjb2RlQnJvd3NlclJlcUlkPTE3NDExNzAwODUyNzciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1741170085),
('gUnivnoggXPxH9MNn3BFpN0YvV5UgSOt0jrPF7KU', 0, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMU03dGhhQU9jb2NNQXVqbnRxc0ZOczFISzdLR1c4UFJCMVNnaG5CYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hbnVuY2lvcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjA7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzQxMDEzNDg3O319', 1741013532),
('lt8CBWutXltv1CADJNmyVt3Q4sVIAqfJNEZWeLTl', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQTdwMU1vbVVCOFdUVUp4Tzdsc0xiQXdkUVF0eG4yTTlyWHdxVmYxdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hbnVuY2lvcy84Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3NDExNzIxODY7fX0=', 1741172422);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `es_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `es_admin`) VALUES
(0, 'admin', 'admin@gmail.com', NULL, '$2y$12$AYKjEUpEZhqo3ZOdTBbL.O4CI8ryDdmUGyjprY5VGUA139WUV8s.6', NULL, '2025-03-03 13:48:39', '2025-03-03 13:48:39', 0),
(1, 'juan', 'juan@gmail.com', NULL, '$2y$12$ntUJbU7Sf0ChbFd/lR1SH.EQFKRzLCwux..Q8kjjLbsk9Yv.faYzC', NULL, '2025-03-05 09:31:26', '2025-03-05 09:31:26', 0),
(2, 'maria', 'maria@gmail.com', NULL, '$2y$12$cqHlD4cSOpXo3WcXSDNxfubcOUAQ7XFaWBlgLHrg1bQlx1bCcJ6g.', NULL, '2025-03-05 09:31:48', '2025-03-05 09:31:48', 0),
(3, 'pedro', 'pedro@gmail.com', NULL, '$2y$12$9sFAOpntGC/nfhhBpaKVGuqUN9XTlquV56OOEJZwi6Fw/kzDrrEKy', NULL, '2025-03-05 09:32:07', '2025-03-05 09:32:07', 0),
(4, 'ana', 'ana@gmail.com', NULL, '$2y$12$Z7wzqGp0cdAMXs6OIekkGuCmzLjsAxIza5jEZNg/U3MEOQ2/dKE9.', NULL, '2025-03-05 09:32:25', '2025-03-05 09:32:25', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comentarios_user_id_foreign` (`user_id`),
  ADD KEY `comentarios_anuncio_id_foreign` (`anuncio_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD CONSTRAINT `anuncios_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_anuncio_id_foreign` FOREIGN KEY (`anuncio_id`) REFERENCES `anuncios` (`id`),
  ADD CONSTRAINT `comentarios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
