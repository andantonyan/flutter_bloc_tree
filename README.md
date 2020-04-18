# Flutter BloC tree experiments

## BloC nodes

### User

```
UserSearchBloc
UserDeleteBloc
UserUpdateBloc
```

### Project

```
ProjectSearchBloc
```

## Managers

```
UserProjectManagerBloc
UserManagerBloc
```


## BloC Tree

```
UserProjectManagerBloc(
  children: [
    ProjectSearchBloc()..add(ProjectSearchFilterChanged()),
    UserManagerBloc(
      children: [
        UserSearchBloc()..add(UserSearchFilterChanged()),
        UserDeleteBloc(),
        UserUpdateBloc(),
      ],
    )
  ],
)

```


![Example](https://i.imgflip.com/3x647j.gif)
