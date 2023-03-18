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

CREATE TABLE `kasbon` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`karyawan_id` INT(11) NOT NULL DEFAULT '0',
	`supervisor_id` INT(11) NOT NULL DEFAULT '0',
	`keperluan` TEXT NOT NULL,
	`tanggal` DATE NOT NULL,
	`tanggal_dihapus` DATE NOT NULL,
	`tanggal_ditolak` DATE NOT NULL,
	`jumlah` BIGINT(20) NOT NULL DEFAULT '0',
	`created_on` INT(11) NOT NULL DEFAULT '0',
	`updated_on` INT(11) NOT NULL DEFAULT '0',
	`status_disetujui` INT(1) NOT NULL,
	`status_aktif` INT(1) NOT NULL,
	`path_bukti_kasbon` VARCHAR(50) NOT NULL DEFAULT '',
	`jenis_bukti` VARCHAR(50) NOT NULL DEFAULT '',
	`nomor_bukti` VARCHAR(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;




CREATE TABLE `karyawan` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL DEFAULT '0',
	`nama` VARCHAR(50) NOT NULL DEFAULT '0',
	`jabatan` VARCHAR(50) NOT NULL DEFAULT '0',
	`tanggal_diangkat` DATE NOT NULL,
	`telp` VARCHAR(50) NOT NULL DEFAULT '',
	`email` VARCHAR(50) NOT NULL DEFAULT '',
	`alamat` TEXT NOT NULL,
	`created_on` INT(11) NOT NULL DEFAULT '0',
	`updated_on` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)
ENGINE=InnoDB
;
