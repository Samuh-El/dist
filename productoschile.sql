-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2020 a las 04:56:15
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `productoschile`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo`
--

CREATE TABLE `correo` (
  `idCorreo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `mensaje` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `Correoscol` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

CREATE TABLE `entidad` (
  `idEntidad` int(11) NOT NULL,
  `nombreEntidad` varchar(120) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '',
  `desEntidad` varchar(500) COLLATE utf8_spanish2_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `entidad`
--

INSERT INTO `entidad` (`idEntidad`, `nombreEntidad`, `desEntidad`) VALUES
(1, 'Ilustre municipalidad de Concepción', 'Municipalidad de Concepcíon, apoya a las pequeñas y medianas pymes de la ciudad mediante esta pagina.'),
(2, 'Ilustre municipalidad de Talcahuano', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jefepyme`
--

CREATE TABLE `jefepyme` (
  `idJefePyme` int(11) NOT NULL,
  `nombreJefePyme` varchar(45) COLLATE utf8_bin NOT NULL,
  `correoJefePyme` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `fonoJefeOyme` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `fecha_creacion_jefePyme` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `jefepyme`
--

INSERT INTO `jefepyme` (`idJefePyme`, `nombreJefePyme`, `correoJefePyme`, `fonoJefeOyme`, `fecha_creacion_jefePyme`) VALUES
(1, 'Pedro Garcia', 'pedro.garcia@gmail.com', '4177223344', '2020-04-06 22:42:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `idPyme` int(11) NOT NULL,
  `nombreProducto` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcionProducto` varchar(500) COLLATE utf8_bin NOT NULL,
  `valorProducto` int(11) NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  `idTipos_Servicios_Productos` int(11) NOT NULL,
  `fecha_creacion_producto` datetime DEFAULT CURRENT_TIMESTAMP,
  `cantidad_like_producto` int(11) DEFAULT '0',
  `cantidad_dislike_producto` int(11) DEFAULT '0',
  `rutaImagenProducto` varchar(900) COLLATE utf8_bin DEFAULT '',
  `Habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `Producto` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idPyme`, `nombreProducto`, `descripcionProducto`, `valorProducto`, `cantidadProducto`, `idTipos_Servicios_Productos`, `fecha_creacion_producto`, `cantidad_like_producto`, `cantidad_dislike_producto`, `rutaImagenProducto`, `Habilitado`, `Producto`) VALUES
(2, 1, 'computador i3 nuevo', 'vendo computador core i3 nuevo', 1000, 12, 11, '2020-04-16 20:18:30', 0, 0, NULL, 0, 1),
(3, 1, 'computador i5 nuevo', 'vendo pc buenardo', 300, 1, 11, '2020-04-17 11:54:08', 0, 0, NULL, 1, 1),
(4, 1, 'bla', 'ble', 12, 1, 11, '2020-04-18 02:16:44', 0, 0, '', 0, 1),
(5, 1, 'bla', 'ble', 12, 1, 11, '2020-04-18 02:16:53', 0, 0, '', 0, 1),
(6, 1, 'aaa', 'bbbb', 1000, 5, 5, '2020-04-18 02:17:34', 0, 0, '', 0, 1),
(7, 1, 'computador i-9', 'vendo computador por mejora', 500000, 1, 11, '2020-04-18 02:19:18', 0, 0, '', 0, 1),
(8, 1, 'bla', 'ble', 10000, 2, 5, '2020-04-18 02:20:41', 0, 0, '', 0, 1),
(9, 1, 'celular', 'vendo celular motog8', 10000, 1, 12, '2020-04-22 16:03:13', 0, 0, 'https://fotos01.deia.eus/2020/04/26/690x278/batman.jpg', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pyme`
--

CREATE TABLE `pyme` (
  `idPyme` int(11) NOT NULL,
  `idEntidad` int(11) NOT NULL,
  `nombrePyme` varchar(200) COLLATE utf8_bin NOT NULL,
  `correoContactoPyme` varchar(100) COLLATE utf8_bin NOT NULL,
  `fonoContactoUno` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fonoContactoDos` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionPyme` varchar(500) COLLATE utf8_bin NOT NULL,
  `giroPyme` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Region` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `JefePyme_idJefePyme` int(11) NOT NULL,
  `Rubro_idRubro` int(11) NOT NULL,
  `link_OnePage` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `fecha_creacion_pyme` datetime DEFAULT CURRENT_TIMESTAMP,
  `idRegion` int(11) NOT NULL,
  `rutaImagenPyme` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `redSocialFacebook` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `redSocialInstagram` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `redSocialTwitter` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `redSocialYoutube` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `pyme`
--

INSERT INTO `pyme` (`idPyme`, `idEntidad`, `nombrePyme`, `correoContactoPyme`, `fonoContactoUno`, `fonoContactoDos`, `descripcionPyme`, `giroPyme`, `Region`, `JefePyme_idJefePyme`, `Rubro_idRubro`, `link_OnePage`, `fecha_creacion_pyme`, `idRegion`, `rutaImagenPyme`, `redSocialFacebook`, `redSocialInstagram`, `redSocialTwitter`, `redSocialYoutube`) VALUES
(1, 1, 'Genbu dos', 'genbu.producciones@gmail.com', '4111223340', '4155667780', 'Comunidad de entretenimiento enfocada en artistas del medio nacional', 'Productora de eventos', 'XV Región de Arica y Parinacota', 1, 1, 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2019/08/26/15668177831743.jpg', '2020-04-06 23:00:34', 11, NULL, 'https://www.facebook.com/zmart.cl', 'https://www.instagram.com/zmart.cl', 'https://twitter.com/ZmartGames', 'https://www.youtube.com/channel/UCHc29pKuVhk59FuFmStpR9w'),
(2, 1, 'bla', 'bsdas', '111', '222', 'sddas', '3553', 'VIII Región del Biobío', 1, 2, 'wqeewe', '2020-05-01 15:09:19', 7, 'fggf', 'fggf', 'fggf', 'ff', 'gfd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redessociales`
--

CREATE TABLE `redessociales` (
  `idRedSocial` int(11) NOT NULL,
  `linkRed` varchar(200) COLLATE utf8_bin NOT NULL,
  `Pyme_idPyme` int(11) NOT NULL,
  `Tipo-Red-Social_idTipo-Red-Social` int(11) NOT NULL,
  `fecha_creacion_redSocial` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `redessociales`
--

INSERT INTO `redessociales` (`idRedSocial`, `linkRed`, `Pyme_idPyme`, `Tipo-Red-Social_idTipo-Red-Social`, `fecha_creacion_redSocial`) VALUES
(1, 'https://www.facebook.com/zmart.cl/', 1, 1, '2020-04-15 12:34:24'),
(2, 'https://www.instagram.com/zmart.cl/', 1, 3, '2020-04-15 12:34:24'),
(3, 'https://twitter.com/ZmartGames', 1, 2, '2020-04-15 12:34:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `idRegion` int(11) NOT NULL,
  `nombreRegion` varchar(100) COLLATE utf8_bin NOT NULL,
  `numeroRegion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`idRegion`, `nombreRegion`, `numeroRegion`) VALUES
(1, 'XV Región de Arica y Parinacota', 15),
(2, 'I Región de Tarapacá', 1),
(3, 'II Región de Antofagasta', 2),
(4, 'III Región de Atacama', 3),
(5, 'IV Región de Coquimbo', 4),
(6, 'V Región de Valparaíso', 5),
(7, 'Región Metropolitana', 13),
(8, 'VI Región del Libertador General Bernardo O’Higgins', 6),
(9, 'VII Región del Maule', 7),
(10, 'XVI Región de Ñuble', 16),
(11, 'VIII Región del Biobío', 8),
(12, 'IX Región de La Araucanía', 9),
(13, 'XIV Región de Los Ríos', 14),
(14, 'X Región de Los Lagos', 10),
(15, 'XI Región Aysén del General Carlos Ibáñez del Campo', 11),
(16, 'XII Región de Magallanes y Antártica Chilena', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE `rubro` (
  `idRubro` int(11) NOT NULL,
  `nombreRubro` varchar(100) COLLATE utf8_bin NOT NULL,
  `descripciónRubro` varchar(500) COLLATE utf8_bin NOT NULL,
  `fecha_creacion_rubro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `rubro`
--

INSERT INTO `rubro` (`idRubro`, `nombreRubro`, `descripciónRubro`, `fecha_creacion_rubro`) VALUES
(1, 'informática', 'cosas de informatica', '2020-04-06 22:43:14'),
(2, 'pastelería', 'cosas de pasteleria', '2020-04-06 22:43:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `idPyme` int(11) NOT NULL,
  `nombreServicio` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcionServicio` varchar(500) COLLATE utf8_bin NOT NULL,
  `valorServicio` int(11) NOT NULL,
  `idTipos_Servicios_Productos` int(11) NOT NULL,
  `fecha_creacion_servicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `cantidad_like_servicio` int(11) DEFAULT '0',
  `cantidad_dislike_servicio` int(11) DEFAULT '0',
  `rutaImagenServicio` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `Habilitado` tinyint(1) NOT NULL DEFAULT '1',
  `Producto` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `idPyme`, `nombreServicio`, `descripcionServicio`, `valorServicio`, `idTipos_Servicios_Productos`, `fecha_creacion_servicio`, `cantidad_like_servicio`, `cantidad_dislike_servicio`, `rutaImagenServicio`, `Habilitado`, `Producto`) VALUES
(2, 1, 'Creacion de pagina web para panaderias', 'Se ofrece profesional para desarrollar paginas web enfocadas en panaderias y reposterias.', 1700, 5, '2020-04-16 20:19:31', 0, 0, NULL, 0, 0),
(3, 1, 'app de comidas', 'creacion de apps de comidas para restautants', 10000, 6, '2020-04-18 02:42:33', 0, 0, NULL, 0, 0),
(4, 1, 'app de comidas', 'creacion de apps de comidas para restautants', 10000, 6, '2020-04-18 02:42:40', 0, 0, NULL, 1, 0),
(5, 1, 'sistema de tickets para local comercial', 'se fabrica sistema de ticket para local comercial, el cual cuenta con todo el codigo y el equipo.', 10000, 6, '2020-04-18 02:45:11', 0, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_onepage`
--

CREATE TABLE `solicitud_onepage` (
  `idSolicitud_OnePage` int(11) NOT NULL,
  `rutaImagenBanner1` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenBanner2` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenBanner3` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenBanner4` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenBanner5` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenDescripcion1` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenDescripcion2` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenDescripcion3` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `descripcion1` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcion2` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcion3` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionEmpresa` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenEmpresa_Nosotros` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP1` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP2` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP3` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP4` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP5` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP6` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP7` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP8` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `rutaImagenSP9` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP1` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP2` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP3` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP4` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP5` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP6` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP7` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP8` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `descripcionSP9` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `linkFacebook` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `linkInstagram` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `linkYouTube` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `linkTwitter` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `linkLinkedin` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `linkDiscord` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `linkSnapchat` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `linkDevianArt` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `fechaSolicitudOnePage` datetime DEFAULT CURRENT_TIMESTAMP,
  `Usuario-Administrador_idUsuario` int(11) NOT NULL,
  `Usuario-Administrador_Pyme_idPyme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo-red-social`
--

CREATE TABLE `tipo-red-social` (
  `idTipo-Red-Social` int(11) NOT NULL,
  `nombre-RedSocial` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `fecha_creacion_tipoRedSocial` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tipo-red-social`
--

INSERT INTO `tipo-red-social` (`idTipo-Red-Social`, `nombre-RedSocial`, `fecha_creacion_tipoRedSocial`) VALUES
(1, 'Facebook', '2020-04-15 12:31:52'),
(2, 'Twitter', '2020-04-15 12:31:52'),
(3, 'Instagram', '2020-04-15 12:31:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos-servicios-productos`
--

CREATE TABLE `tipos-servicios-productos` (
  `idTipos_Servicios_Productos` int(11) NOT NULL,
  `idRubro` int(11) NOT NULL,
  `nombreTipo` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcionTipo` varchar(45) COLLATE utf8_bin NOT NULL,
  `fecha_creacion_TipoServicioProducto` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tipos-servicios-productos`
--

INSERT INTO `tipos-servicios-productos` (`idTipos_Servicios_Productos`, `idRubro`, `nombreTipo`, `descripcionTipo`, `fecha_creacion_TipoServicioProducto`) VALUES
(5, 1, 'Creacion de paginas web', '', '2020-04-16 18:44:52'),
(6, 1, 'Creacion de aplicaciones moviles', '', '2020-04-16 18:45:21'),
(11, 1, 'Venta de ordenadores', '', '2020-04-16 18:46:27'),
(12, 1, 'Venta de celulares', '', '2020-04-16 18:46:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `NombreUsuario` varchar(200) COLLATE utf8_bin NOT NULL,
  `ClaveUsuario` varchar(45) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(200) COLLATE utf8_bin NOT NULL,
  `celular` int(11) NOT NULL,
  `correo` varchar(45) COLLATE utf8_bin NOT NULL,
  `fecha_creacion_usuario` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario-administrador`
--

CREATE TABLE `usuario-administrador` (
  `idUsuario` int(11) NOT NULL,
  `NombreUsuario` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ApellidoUsuario` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ClaveUsuario` varchar(45) COLLATE utf8_bin NOT NULL,
  `Pyme_idPyme` int(11) NOT NULL,
  `direccion` varchar(200) COLLATE utf8_bin NOT NULL,
  `celular` varchar(11) COLLATE utf8_bin NOT NULL,
  `correo` varchar(45) COLLATE utf8_bin NOT NULL,
  `fecha_creacion_usuarioAdmin` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuario-administrador`
--

INSERT INTO `usuario-administrador` (`idUsuario`, `NombreUsuario`, `ApellidoUsuario`, `ClaveUsuario`, `Pyme_idPyme`, `direccion`, `celular`, `correo`, `fecha_creacion_usuarioAdmin`) VALUES
(1, 'Samuel', 'Gajardo', '12345', 1, 'Michaihue 1234', '947512328', 'samuel.gajardo@gmail.com', '2020-04-06 23:03:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `correo`
--
ALTER TABLE `correo`
  ADD PRIMARY KEY (`idCorreo`);

--
-- Indices de la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD PRIMARY KEY (`idEntidad`);

--
-- Indices de la tabla `jefepyme`
--
ALTER TABLE `jefepyme`
  ADD PRIMARY KEY (`idJefePyme`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_Producto_Tipos-Servicios-Productos1` (`idTipos_Servicios_Productos`),
  ADD KEY `FK_idPyme_producto` (`idPyme`) USING BTREE;

--
-- Indices de la tabla `pyme`
--
ALTER TABLE `pyme`
  ADD PRIMARY KEY (`idPyme`),
  ADD KEY `fk_Pyme_JefePyme1` (`JefePyme_idJefePyme`),
  ADD KEY `fk_Pyme_Rubro1` (`Rubro_idRubro`),
  ADD KEY `fk_Pyme_Region1` (`idRegion`),
  ADD KEY `FK_idEntidad` (`idEntidad`);

--
-- Indices de la tabla `redessociales`
--
ALTER TABLE `redessociales`
  ADD PRIMARY KEY (`idRedSocial`),
  ADD KEY `fk_RedesSociales_Pyme1` (`Pyme_idPyme`),
  ADD KEY `fk_RedesSociales_Tipo-Red-Social1` (`Tipo-Red-Social_idTipo-Red-Social`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`idRegion`);

--
-- Indices de la tabla `rubro`
--
ALTER TABLE `rubro`
  ADD PRIMARY KEY (`idRubro`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `Tipos-Servicios-Productos_idTipos-Servicios-Productos` (`idTipos_Servicios_Productos`),
  ADD KEY `FK_idPyme_servicio` (`idPyme`);

--
-- Indices de la tabla `solicitud_onepage`
--
ALTER TABLE `solicitud_onepage`
  ADD PRIMARY KEY (`idSolicitud_OnePage`),
  ADD KEY `fk_Solicitud_OnePage_Usuario-Administrador1` (`Usuario-Administrador_idUsuario`,`Usuario-Administrador_Pyme_idPyme`);

--
-- Indices de la tabla `tipo-red-social`
--
ALTER TABLE `tipo-red-social`
  ADD PRIMARY KEY (`idTipo-Red-Social`);

--
-- Indices de la tabla `tipos-servicios-productos`
--
ALTER TABLE `tipos-servicios-productos`
  ADD PRIMARY KEY (`idTipos_Servicios_Productos`),
  ADD KEY `FK_idRubro` (`idRubro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `usuario-administrador`
--
ALTER TABLE `usuario-administrador`
  ADD PRIMARY KEY (`idUsuario`,`Pyme_idPyme`),
  ADD KEY `fk_Usuario_Pyme1` (`Pyme_idPyme`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `correo`
--
ALTER TABLE `correo`
  MODIFY `idCorreo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entidad`
--
ALTER TABLE `entidad`
  MODIFY `idEntidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jefepyme`
--
ALTER TABLE `jefepyme`
  MODIFY `idJefePyme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pyme`
--
ALTER TABLE `pyme`
  MODIFY `idPyme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `redessociales`
--
ALTER TABLE `redessociales`
  MODIFY `idRedSocial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `idRegion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `rubro`
--
ALTER TABLE `rubro`
  MODIFY `idRubro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `solicitud_onepage`
--
ALTER TABLE `solicitud_onepage`
  MODIFY `idSolicitud_OnePage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo-red-social`
--
ALTER TABLE `tipo-red-social`
  MODIFY `idTipo-Red-Social` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipos-servicios-productos`
--
ALTER TABLE `tipos-servicios-productos`
  MODIFY `idTipos_Servicios_Productos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario-administrador`
--
ALTER TABLE `usuario-administrador`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_idPyme` FOREIGN KEY (`idPyme`) REFERENCES `pyme` (`idPyme`),
  ADD CONSTRAINT `fk_Producto_Tipos-Servicios-Productos1` FOREIGN KEY (`idTipos_Servicios_Productos`) REFERENCES `tipos-servicios-productos` (`idTipos_Servicios_Productos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pyme`
--
ALTER TABLE `pyme`
  ADD CONSTRAINT `FK_idEntidad` FOREIGN KEY (`idEntidad`) REFERENCES `entidad` (`idEntidad`),
  ADD CONSTRAINT `fk_Pyme_JefePyme1` FOREIGN KEY (`JefePyme_idJefePyme`) REFERENCES `jefepyme` (`idJefePyme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pyme_Region1` FOREIGN KEY (`idRegion`) REFERENCES `region` (`idRegion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pyme_Rubro1` FOREIGN KEY (`Rubro_idRubro`) REFERENCES `rubro` (`idRubro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `redessociales`
--
ALTER TABLE `redessociales`
  ADD CONSTRAINT `fk_RedesSociales_Pyme1` FOREIGN KEY (`Pyme_idPyme`) REFERENCES `pyme` (`idPyme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RedesSociales_Tipo-Red-Social1` FOREIGN KEY (`Tipo-Red-Social_idTipo-Red-Social`) REFERENCES `tipo-red-social` (`idTipo-Red-Social`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `FK_idPyme_servicio` FOREIGN KEY (`idPyme`) REFERENCES `pyme` (`idPyme`),
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`idTipos_Servicios_Productos`) REFERENCES `tipos-servicios-productos` (`idTipos_Servicios_Productos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitud_onepage`
--
ALTER TABLE `solicitud_onepage`
  ADD CONSTRAINT `fk_Solicitud_OnePage_Usuario-Administrador1` FOREIGN KEY (`Usuario-Administrador_idUsuario`,`Usuario-Administrador_Pyme_idPyme`) REFERENCES `usuario-administrador` (`idUsuario`, `Pyme_idPyme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipos-servicios-productos`
--
ALTER TABLE `tipos-servicios-productos`
  ADD CONSTRAINT `FK_idRubro` FOREIGN KEY (`idRubro`) REFERENCES `rubro` (`idRubro`);

--
-- Filtros para la tabla `usuario-administrador`
--
ALTER TABLE `usuario-administrador`
  ADD CONSTRAINT `fk_Usuario_Pyme1` FOREIGN KEY (`Pyme_idPyme`) REFERENCES `pyme` (`idPyme`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
