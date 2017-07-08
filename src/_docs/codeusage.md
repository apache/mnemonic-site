---
layout: docs
title: Code Usage
permalink: /docs/codeusage.html
---

{% raw %}

### How to use it ?

#### Define a Non-Volatile class:

```java
/**
 * a durable class should be abstract, implement Durable interface and marked with @DurableEntity annotation
 */
@DurableEntity
public abstract class Person<E> implements Durable, Comparable<Person<E>> {
        E element; // Generic Type

        /**
         * callback for this durable object creation
         */
        @Override
        public void initializeAfterCreate() { 
                System.out.println("Initializing After Created");
        }
        
        /**
         * callback for this durable object recovery
         */
        @Override
        public void initializeAfterRestore() { 
                System.out.println("Initializing After Restored");
        }

        /**
         * setup generic info manually to avoid performance penalty
         */
        @Override
        public void setupGenericInfo(EntityFactoryProxy[] efproxies, GenericField.GType[] gftypes) {

        }

        @Test
        public void testOutput() throws RetrieveDurableEntityError {
                System.out.printf("Person %s, Age: %d ( %s ) \n", getName(), getAge(),
                                null == getMother()? "No Recorded Mother" : "Has Recorded Mother");
        }

        public int compareTo(Person<E> anotherPerson) {
                int ret = 0;
                if (0 == ret) ret = getAge().compareTo(anotherPerson.getAge());
                if (0 == ret) ret = getName().compareTo(anotherPerson.getName());
                return ret;
        }

        /**
         * Getters and Setters for non-volatile fields marked with @DurableGetter and @DurableSetter
         */
        @DurableGetter(Id = 1L)
        abstract public Short getAge();
        @DurableSetter
        abstract public void setAge(Short age);

        @DurableGetter(Id = 2L)
        abstract public String getName() throws RetrieveDurableEntityError;
        @DurableSetter
        abstract public void setName(String name, boolean destroy) throws OutOfPersistentMemory, RetrieveDurableEntityError;

        @DurableGetter(Id = 3L)
        abstract public Person<E> getMother() throws RetrieveDurableEntityError;
        @DurableSetter
        abstract public void setMother(Person<E> mother, boolean destroy) throws RetrieveDurableEntityError;

        @DurableGetter(Id = 4L)
        abstract public Person<E> getFather() throws RetrieveDurableEntityError;
        @DurableSetter
        abstract public void setFather(Person<E> mother, boolean destroy) throws RetrieveDurableEntityError;
}

```

#### Use a non-volatile class:

##### Setup an allocator for non-volatile object graphs.


```java
        // create an allocator instance
        NonVolatileMemAllocator act = new NonVolatileMemAllocator(1024 * 1024 * 8, "./pobj_person.dat", true);
        
        // fetch handler store capacity from this non-volatile storage managed by this allocator
        KEYCAPACITY = act.handlerCapacity();
        ....
        // close it after use
        act.close();
```

##### Generate structured non-volatile objects.
```java
        // create a new non-volatile person object from this specific allocator
        person = PersonFactory.create(act);
        
        // set attributes
        person.setAge((short)rand.nextInt(50));
        person.setName(String.format("Name: [%s]", UUID.randomUUID().toString()), true);

        // keep this person on non-volatile handler store
        act.setHandler(keyidx, person.getHandler());

        for (int deep = 0; deep < rand.nextInt(100); ++deep) {
        
                // create another person as mother
                mother = PersonFactory.create(act);
                mother.setAge((short)(50 + rand.nextInt(50)));
                mother.setName(String.format("Name: [%s]", UUID.randomUUID().toString()), true);
                
                // set the person's mother
                person.setMother(mother, true);

                person = mother;
        }

```


##### Use the non-volatile objects


```java
        for (long i = 0; i < KEYCAPACITY; ++i) {
        
                System.out.printf("----------Key %d--------------\n", i);
                // iterate non-volatile handlers from handler store of this specific allocator
                val = act.getHandler(i);
                if (0L == val) {
                        break;
                }
                
                // restore person objects from this specific allocator
                Person<Integer> person = PersonFactory.restore(act, val, true);
                
                while (null != person) {
                        person.testOutput();
                        // iterate all mother's ancestors
                        person = person.getMother();
                }
        }

```


##### Perform the durable native computing (e.g. printing) w/o packing/unpacking massive object graphs



```java
         // fetch print service
         GeneralComputingService gcsvr = Utils.getGeneralComputingService("print");
         // instantiate a value info for a value matrix
         ValueInfo vinfo = new ValueInfo();
         // instantiate a object stack
         List<long[][]> objstack = new ArrayList<long[][]>();
         // fill up with all durable object info in order
         objstack.add(firstnv.getNativeFieldInfo());
         objstack.add(person.getNativeFieldInfo());
         // configure the Id stack for each level of durable objects
         long[][] fidinfostack = {{2L, 1L}, {0L, 1L}};
         // configure the handler of a value matrix
         vinfo.handler = handler;
         // set translate table from handler's allocator
         vinfo.transtable = m_act.getTranslateTable();
         // specify the durable type of value
         vinfo.dtype = DurableType.SHORT;
         // generate frames for this value matri from both stacks
         vinfo.frames = Utils.genNativeParamForm(objstack, fidinfostack);
         // form an array of value infos
         ValueInfo[] vinfos = {vinfo};
         // perform the print operation
         gcsvr.perform(vinfos);
```

{% endraw %}