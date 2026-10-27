# Algorithm Exercise: Airport Luggage Fee Calculator

You are building a **luggage fee calculator for an airport check-in system**.

The system must calculate the **total luggage fee** based on:

- Passenger type
- Luggage weight
- Travel class

---

## Passenger Types

The passenger must enter one of the following:

- `adult`
- `child`

If the passenger type is not one of these values, the program must output:

> Invalid passenger type.

---

# Travel Class

The passenger must also enter their **travel class**:

- `economy`
- `business`

If the value is not one of these options, show:

> Invalid travel class.

---

## Luggage Weight Rules

The user must enter the **weight of the luggage in kilograms**.

If the value is:

- Not a number
- Less than or equal to **0**
- Greater than **60**

The program must output:

> Invalid luggage weight.

---

### Business Class

- Up to **30 kg** → free
- Above 30 kg → **$8 per extra kg**

---

## Child Passenger Discount

If the passenger type is **child**, the final luggage fee receives a:

**50% discount**

---

## Final Fee

If the luggage exceeds the free allowance:

```
Extra Weight = luggageWeight − freeAllowance
Fee = extraWeight × pricePerKg
```

If the passenger is a **child**, apply the **50% discount**.

---

## Output Examples

Example

passengerType = adult
travelClass = economy
luggageWeight = 25

Extra weight: 5 kg
Total fee: $50