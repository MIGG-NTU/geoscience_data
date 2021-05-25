
## Active faults in Myanmar

- Faults-all.gmt
    - Note: original file from Xin Wang in 2018
    - Faults-only.gmt : locations of all the faults, except megathrusts
    - Megathrust-Arakan.gmt
        - Note
            - Locations of megathrusts, i.e., Arakan megathrusts
            - The common points between those three Arakan megathrust segments are commented in Megathrust-Arakan.gmt
        - Megathrust-Arakan-1-blind.gmt : the blind segment
            - Same as Faults-T-blind-arakan.gmt
        - Megathrust-Arakan-2.gmt
            - Same as Faults-T-arakan-2.gmt
        - Megathrust-Arakan-3.gmt
            - Same as Faults-T-arakan-1.gmt

### Faults execpt megathrusts

- Faults-RL.gmt
    - Note: Right-lateral fault
    - Faults-RL-Sagaing.gmt : Sagaing faults
    - Faults-RL-Red.gmt
        - Note
            - Red river faults
            - The order in Faults-RL-Red.gmt is 3241.
        - Faults-RL-Red-1.gmt
        - Faults-RL-Red-2.gmt
        - Faults-RL-Red-3.gmt
        - Faults-RL-Red-4.gmt : a separated segment
    - Faults-RL-Other.gmt : Other right-lateral faults
        - Faults-RL-AndamanSea.gmt: Andaman Sea and Sumatra faults
- Faults-LL.gmt
    - Left-lateral fault
- Faults-N.gmt
    - Normal fault
- Faults-T.gmt
    - Note
        - Thrust fault
        - Include megathrusts, i.e., Arakan megathrusts
        - Exclude blind thrust faults
    - Faults-T-arakan.gmt : Arakan megathrust
        - Faults-T-arakan-1.gmt
        - Faults-T-arakan-2.gmt
    - Faults-T-Dauki.gmt : Dauki thrust fault
    - Faults-T-Kabaw.gmt : Kabaw thrust fault
        - Faults-T-Kabaw-1.gmt
        - Faults-T-Kabaw-2.gmt : a separated segment
    - Faults-T-Naga.gmt : Naga thrust fault
        - Faults-T-Naga-1.gmt
        - Faults-T-Naga-2.gmt
    - Faults-T-Himalayan.gmt : Himalayan frontal thrust
        - Faults-T-Himalayan-1.gmt
        - Faults-T-Himalayan-2.gmt
        - Faults-T-Himalayan-3.gmt : A wrong segment that is in Bangladesh.
    - Faults-T-Other.gmt : Other thrust faults
        - Faults-T-Other-1.gmt
        - Faults-T-Other-2.gmt
- Faults-T-blind.gmt
    - Note: Blind thrust faults
    - Faults-T-blind-arakan.gmt : Blind Arakan megathrust
    - Faults-T-blind-other.gmt : Other blind thrust faults
- Faults-RR.gmt
    - Unkown fault type
    - I guess it is right-lateral
- Faults-RF.gmt
    - Unkown fault type
    - I guess it is right-lateral
- Faults-Other.gmt
    - Other types of fault, i.e., Andanman sea spreading center


### Other faults

- Faults-RL-RedRiver-blind.gmt
    - Blind red river fault modified from HimaTibetMap-1.1
- Faults-RL-AndamanSea.gmt
    - right-lateral fault in Andaman Sea

## Scripts

- extract-fault.pl : extract diff types of faults from origin EOS dataset
- extract-special-fault.pl : extract some special faults
- extract-special-fault-InBox.pl : extract faults within a box

