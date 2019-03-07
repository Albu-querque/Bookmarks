package net.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="bookmarks")
public class Bookmarks {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="name")
    private String name;
    @Column(name="Date")
    private Date date;
    @Column(name="Reference")
    private String reference;
    @Column(name="Description")
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Bookmarks{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", calendar=" + date +
                ", reference='" + reference + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
