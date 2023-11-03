breed [truck-agents truck]
breed [stations station]
breed [distribution-centers distribution-center]

globals [
  time-factor ; Time scaling factor (hours per tick)
  current-time ; Simulated time in weeks
  current-month ; To track the current month
  monthly-gas-delivered ; To track the monthly total of gasoline delivered
  monthly-gas-consumption ; To track the monthly gas consumption
]

distribution-centers-own [
  initial-distribution-center-gas ; Initial gas at the distribution center (fixed amount)
  distribution-center-gas
]

stations-own [
  fuel-capacity
  gas-consumption-rate ; Gas consumption rate at the service station
  service-station-gas
  service-station-gas-threshold ; Minimum gas level for the service station
  is-la-maxima? ; Variable to identify "La Maxima" service station
]

truck-agents-own [
  transportation-tank
  at-distribution-center?
  at-service-station?
]

to setup
  clear-all
  create-distribution-center
  create-service-station
  create-trucks
  set time-factor 6 ; 6 hours in a "day"
  set current-time 0 ; Initialize current-time
  set current-month 0 ; Initialize current month
  set monthly-gas-delivered 0 ; Initialize the monthly total of gasoline delivered
  set monthly-gas-consumption 383470 ; Initialize the monthly gas consumption
  reset-ticks
end

to create-distribution-center
  create-distribution-centers 4 [
    set shape "triangle"
    set size 2
    set color green
    setxy random-xcor random-ycor
    set distribution-center-gas 0 ; Set an initial amount of gas
  ]
end

to create-service-station
  create-stations 578 [
    set shape "circle"
    set size 0.5
    set color red
    setxy random-xcor random-ycor
    set gas-consumption-rate 2130 ; Adjusted gas consumption rate
    set fuel-capacity 305000
    set service-station-gas 0 ; Set an initial amount of gas
    set service-station-gas-threshold 61000 ; Minimum gas level for the service station
    set is-la-maxima? false ; Add this variable to identify "La Maxima"
  ]
  ; Set "La Maxima" as a special service station
  ask one-of stations [
    set is-la-maxima? true
  ]
end

; Custom function to calculate the day of the week
to-report day-of-week [time]
  let days-per-week 7 ; There are 7 days in a week
  report ((time mod (days-per-week * 6)) / 6) + 1 ; Calculate the day of the week
end

to create-trucks ; This procedure was missing
  create-truck-agents 100 [
    set shape "truck"
    set size 2
    set transportation-tank 35000
    set at-distribution-center? true
    set at-service-station? true
  ]
end

to move-trucks
  ask truck-agents [
    let destination nobody
    ifelse at-distribution-center? [
      if transportation-tank = 0 [
        set transportation-tank 35000
      ]
      set destination one-of stations with [shape = "circle"]
      set at-distribution-center? false
      set at-service-station? true
    ][
      set destination one-of distribution-centers with [shape = "triangle"]
      set at-service-station? false
      set at-distribution-center? true
    ]

    if destination != nobody [
      move-to destination
    ]
  ]
end

to update-time
  let hours-per-day 6
  let time-passed ticks * time-factor
  set current-time time-passed / hours-per-day
end

to update-availability
  set service-station-gas sum [transportation-tank] of truck-agents
  set distribution-center-gas distribution-center-gas - (35000 * count truck-agents)
  if distribution-center-gas <= 0 [
    stop
  ]
end

to update-service-station-gas
  let gas-to-deliver 0 ; Initialize the variable

  ; Decrease service station gas based on the gas consumption rate
  ask stations with [shape = "circle"] [
    if day-of-week(current-time) >= 1 and day-of-week(current-time) <= 6 [ ; Check if it's a weekday (Monday to Saturday)
      let consumption gas-consumption-rate
      if service-station-gas < consumption [
        set consumption service-station-gas
      ]
      set service-station-gas service-station-gas - consumption
      ; Call trucks to deliver gas until the service-station-gas is above 20% of capacity
      if service-station-gas < (fuel-capacity * 0.2) [
        let need-gas fuel-capacity - service-station-gas
        let available-trucks truck-agents with [at-distribution-center?]
        ifelse any? available-trucks [
          ; Calculate how much gas can be delivered by available trucks
          let gas-to-deliver-trucks min list need-gas (sum [transportation-tank] of available-trucks)
          ; Share the delivery among available trucks
          if gas-to-deliver > 0 [
            let gas-delivered 0
            ask available-trucks [
              let gas-contributed min list (transportation-tank - gas-delivered) gas-to-deliver
              set gas-delivered gas-delivered + gas-contributed
              set transportation-tank (transportation-tank - gas-contributed)
            ]
            set service-station-gas (service-station-gas + gas-delivered)
          ]
        ] [
          ; Handle the case when no trucks are available at the distribution center
          ; Maybe a warning message
        ]
      ]
    ]

    ; Handle "La Maxima" separately
    let la-maxima one-of stations with [is-la-maxima?]
    if la-maxima != nobody [ ; Check if "La Maxima" exists
      if day-of-week(current-time) >= 1 and day-of-week(current-time) <= 6 [ ; Check if it's a weekday (Monday to Saturday)
        let consumption gas-consumption-rate
        if [service-station-gas] of la-maxima < consumption [
          set consumption [service-station-gas] of la-maxima
        ]
        ask la-maxima [
          set service-station-gas (service-station-gas - consumption)
        ]
      ]
    ]
  ]
end

to go
  if ticks < 1000 [
    if ticks = 0 [setup]
    ask truck-agents [
      move-trucks
    ]
    update-service-station-gas ; Update service station gas
    update-time
    ; Calculate the gas consumed by all service stations, including "La Maxima"
    let daily-consumption sum [gas-consumption-rate] of stations ; Corrected for 6-hour ticks
    let total-hours-in-month 24 * 6
    let la-maxima one-of stations with [is-la-maxima?]
    let la-maxima-gas-consumption [gas-consumption-rate] of la-maxima ; Corrected for 6-hour ticks
    set monthly-gas-delivered (monthly-gas-delivered + daily-consumption)

    if current-time >= (current-month + 1) * total-hours-in-month [
      let current-month-number ((current-month mod 12) + 1) ; Count months from 1 to 12
      ; print (word "Month " current-month-number ": Daily Average Gas Consumed By La Maxima: " (la-maxima-gas-consumption * 6))
      print (word "Month " current-month-number ": Distribution Center Monthly Gas Production: " (monthly-gas-delivered))
      set monthly-gas-delivered 0
      set daily-consumption 0
      set current-month (current-month + 1)
    ]

    tick
  ]
end