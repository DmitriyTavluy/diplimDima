package otchetnost.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "productturnover")
public class Tovarooborot {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idtovar;

    private String volume;
    private String assortment;
    private String speed;
    private String rhythm;
    private String datetime;

    @ManyToOne
    @JoinColumn(name = "id")
    private Store id;
    private boolean checkOtchet;

    @ManyToMany
    @JoinTable(
            name = "tovarooborot_store",
            joinColumns = {@JoinColumn(name = "idTovara")},
            inverseJoinColumns = {@JoinColumn(name = "idStore")}
    )
    private Set<Store> stores = new HashSet<>();

    public Tovarooborot() {
    }

    public Tovarooborot(String volume, String assortment, String speed, String rhythm, String datetime, Store id, boolean checkOtchet) {
        this.volume = volume;
        this.assortment = assortment;
        this.speed = speed;
        this.rhythm = rhythm;
        this.datetime = datetime;
        this.id = id;
        this.checkOtchet = checkOtchet;
    }

    public boolean isCheckOtchet() {
        return checkOtchet;
    }

    public void setCheckOtchet(boolean checkOtchet) {
        this.checkOtchet = checkOtchet;
    }

    public int getIdtovar() {
        return idtovar;
    }

    public void setIdtovar(int idtovar) {
        this.idtovar = idtovar;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public String getAssortment() {
        return assortment;
    }

    public void setAssortment(String assortment) {
        this.assortment = assortment;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }

    public String getRhythm() {
        return rhythm;
    }

    public void setRhythm(String rhythm) {
        this.rhythm = rhythm;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public Store getId() {
        return id;
    }

    public void setId(Store id) {
        this.id = id;
    }

    public Set<Store> getStores() {
        return stores;
    }

    public void setStores(Set<Store> stores) {
        this.stores = stores;
    }
}
