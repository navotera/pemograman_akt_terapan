CREATE TABLE `users` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nama` VARCHAR(150) NOT NULL,
	`email` VARCHAR(150) NOT NULL,
	`password` VARCHAR(150) NOT NULL,
	`last_login` INT(150) NOT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `roles` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nama` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `user_roles` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL DEFAULT '0',
	`role_id` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `karyawan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nomor_induk` VARCHAR(50) NOT NULL,
  `nama` VARCHAR(50) NOT NULL,
  `jenis_kelamin` ENUM('L', 'P') NOT NULL,
  `tanggal_lahir` DATE NOT NULL,
  `alamat` TEXT NOT NULL,
  `no_telp` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `tanggal_masuk` DATE NOT NULL,
  `id_jabatan` INT(11) NOT NULL,
  `gaji_pokok` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jabatan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tunjangan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_jabatan` INT(11) NOT NULL,
  `jenis_tunjangan` VARCHAR(50) NOT NULL,
  `jumlah_tunjangan` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `presensi` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `karyawan_id` INT(11) NOT NULL,
    `tanggal` DATE NOT NULL,
    `jam_masuk` TIME NOT NULL,
    `jam_keluar` TIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan`(`id`)
        ON DELETE CASCADE
) ENGINE=InnoDB;



CREATE TABLE `pemotongan_gaji` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `karyawan_id` INT(11) NOT NULL,
  `nama` VARCHAR(100) NOT NULL,
  `besar_pemotongan` DECIMAL(10,2) NOT NULL,
  `keterangan` TEXT DEFAULT NULL,
  `tanggal_pemotongan` DATE NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `bonus` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `karyawan_id` INT(11) NOT NULL,
  `nama` VARCHAR(100) NOT NULL,
  `besar_bonus` DECIMAL(10,2) NOT NULL,
  `keterangan` TEXT DEFAULT NULL,
  `tanggal_bonus` DATE NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- secara periodik
CREATE TABLE `penggajian` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `karyawan_id` INT(11) NOT NULL,
  `bulan` INT(2) NOT NULL,
  `tahun` INT(4) NOT NULL,
  `gaji_pokok` DECIMAL(10,2) NOT NULL,
  `total_pemotongan` DECIMAL(10,2) NOT NULL,
  `total_tunjangan` DECIMAL(10,2) NOT NULL,
  `total_bonus` DECIMAL(10,2) NOT NULL,
  `total_gaji` DECIMAL(10,2) NOT NULL,
  `tanggal_penggajian` DATE NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;