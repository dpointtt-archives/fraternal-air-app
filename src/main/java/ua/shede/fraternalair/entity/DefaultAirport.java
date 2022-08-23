package ua.shede.fraternalair.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "default_airport")
public class DefaultAirport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "d_country_name")
    private String defaultCountryName = "Poland";

    @Column(name = "d_airport_name")
    private String defaultAirportName;

    @OneToMany(mappedBy = "startAirport")
    private List<Flight> flightsStart;

}
