---
title: "Connecting to redux store with TS"
---

Assume the store has a defined type `StoreType`.

Connect store keys to component props
```ts
const mapStateToProps = (state: StoreType) => (
  { interesting: state.interesting, keys: state.keys }
)
```

Connect component methods to store actions
```ts
const mapDispatch = {
  performAction: () => REALLY_IMPORTANT_ACTION,
  doSomethingElse: (really: string, confusing: Params) => (
    {
      type: 'ANOTHER_IMPORTANT_ACTION',
      really: really,
      confusing: confusing
    }
  )
};
```

Finally connect the component
```ts
const connector = connect(mapStateToProps, mapDispatch);

// Use these Props in the component type
interface Props extends ConnectedProps<typeof connector> {
  local: string,
  props: number[],
  thatArentConnected: boolean
}

export default connector(Component);
```
