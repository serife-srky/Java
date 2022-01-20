package com.otoparktakip.repository;

import com.otoparktakip.model.Personel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface PersonelRepository extends JpaRepository<Personel, Long> {

}
