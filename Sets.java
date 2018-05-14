class Sets {

  public interface Set<A> {
    boolean isEmpty();
    boolean contains(A x);
    Set<A> insert(A x);
    Set<A> union(Set<A> s);
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

    @Override
    public Set<A> insert(A x) {
      return new InsertedSet<>(this, x);
    }

    @Override
    public Set<A> union(Set<A> s) {
      return s;
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

    @Override
    public Set<A> insert(A x) {
      return this;
    }

    @Override
    public Set<A> union(Set<A> s) {
      return this;
    }
  }

  public static class InsertedSet<A> implements Set<A> {

    private final Set<A> base;
    private final A elem;

    public InsertedSet(Set<A> s, A x) {
      this.base = s;
      this.elem = x;
    }

    @Override
    public boolean isEmpty() {
      return false;
    }

    @Override
    public boolean contains(A x) {
      return elem.equals(x) || base.contains(x);
    }

    @Override
    public Set<A> insert(A x) {
      return new InsertedSet<>(this, x);
    }

    @Override
    public Set<A> union(Set<A> s) {
      return new UnionedSet<>(this, s);
    }
  }

  public static class UnionedSet<A> implements Set<A> {

    private final Set<A> left;
    private final Set<A> right;

    public UnionedSet(Set<A> s1, Set<A> s2) {
      this.left = s1;
      this.right = s2;
    }

    @Override
    public boolean isEmpty() {
      return left.isEmpty() && right.isEmpty();
    }

    @Override
    public boolean contains(A x) {
      return left.contains(x) || right.contains(x);
    }

    @Override
    public Set<A> insert(A x) {
      return new InsertedSet<>(this, x);
    }

    @Override
    public Set<A> union(Set<A> s) {
      return new UnionedSet<>(this, s);
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

      @Override
      public Set<Integer> insert(Integer x) {
        return new InsertedSet<>(this, x);
      }

      @Override
      public Set<Integer> union(Set<Integer> s) {
        return new UnionedSet<>(this, s);
      }
    };

    System.out.println("oneThreeFive contains 4: " + oneThreeFive.contains(4));
    System.out.println("evens contains 4: " + evens.contains(4));
  }

  private Sets() {}
}
