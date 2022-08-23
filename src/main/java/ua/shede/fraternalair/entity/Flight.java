package ua.shede.fraternalair.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "flight")
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "plane_id", nullable = false)
    private Plane plane;

    @Column(name = "flight_code")
    private String flightCode;

    @ManyToOne
    @JoinColumn(name = "start_airport_id")
    private DefaultAirport startAirport;

    @ManyToOne
    @JoinColumn(name = "destination_country_id")
    private Country country;

    @ManyToOne
    @JoinColumn(name = "end_airport_id")
    private Airport endAirport;

    @Column(name = "start_time")
    private Timestamp flightStartTime;

    @Column(name = "end_time")
    private Timestamp flightEndTime;

    @Column(name = "free_seats")
    private int flightFreeSeat;

    @OneToMany(mappedBy = "flight")
    private List<FlightTicket> flightTickets;

}
