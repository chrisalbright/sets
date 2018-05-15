class Sets {

  public interface Set<A> {
    boolean isEmpty();
    boolean contains(A x);
    default Set<A> insert(final A newX) {
      final Set<A> parent = this;
      return new Set<A>() {
        @Override public boolean isEmpty() {
          return false;
        }
        @Override public boolean contains(A x) {
          return newX == x || parent.contains(x);
        }
      };
    }
    default Set<A> union(Set<A> s) {
      final Set<A> parent = this;
      return new Set<A>() {
        @Override public boolean isEmpty() {
          return false;
        }
        @Override public boolean contains(A x) {
          return s.contains(x) || parent.contains(x);
        }
      };
    }
  }

  public static class EmptySet<A> implements Set<A> {

    public EmptySet() {}

    @Override
    public boolean isEmpty() {
      return true;
    }

    @Override
    public boolean contains(A x) {
      return false;
    }

  }

  public static class TotalSet<A> implements Set<A> {

    public TotalSet() {}

    @Override
    public boolean isEmpty() {
      return false;
    }

    @Override
    public boolean contains(A x) {
      return true;
    }

  }

  public static void main(String[] args) {

    Set<Integer> oneThreeFive = new EmptySet<Integer>()
        .insert(3)
        .union(new EmptySet<Integer>().insert(1))
        .insert(5);

    Set<Integer> evens = new Set<Integer>() {

      @Override
      public boolean isEmpty() {
        return false;
      }

      @Override
      public boolean contains(Integer x) {
        return x % 2 == 0;
      }

    };

    System.out.println("oneThreeFive contains 4: " + oneThreeFive.contains(4));
    System.out.println("evens contains 4: " + evens.contains(4));
  }

  private Sets() {}
}
