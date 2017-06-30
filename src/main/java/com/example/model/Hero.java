package com.example.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by admin on 2017/6/30.
 */
@Entity
@Table(name = "hero")

public class Hero implements Serializable{
    @Id
    @GeneratedValue()
    private Long id;

    @Column()
    private String name;

    public Hero() {
    }

    public Hero(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Hero{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
