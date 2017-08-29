package exam;

public class Test implements TestInterface{

	@Override
	public void printStr1() {
	}

	@Override
	public void printStr2() {
	}

	public void printStr3() {
	}
	
	public static void main(String[] args) {
		TestInterface ti = new Test();
	}
}
