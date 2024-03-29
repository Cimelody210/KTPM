// Nó chỉ quan tâm đến couter kiển int
// Khi cần 1 state phục vụ cho các tác vụ như lấy data từ internet
    // => cần state file để định nghĩa chúng

sealed class CounterEvent { }

final class CounterIncrementPressed extends CounterEvent {}

// Giá trị int đó cũng là state của bloc đó
class CounterBloc extends Bloc<CounterEvent, int>{
    CounterBloc(): super(0) {
        on<CounterIncrementPressed>( event, emit) {
            emit(state + 1);
        };
    }
}