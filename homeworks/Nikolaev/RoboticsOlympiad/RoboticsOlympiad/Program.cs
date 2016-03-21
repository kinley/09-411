using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RoboticsOlympiad {
	class Subject {
		private string name;
		private List<AgeGroup> groups;

		public string Name {
			get {
				return name;
			}
		}
		
		public List<AgeGroup> Groups {
			get {
				return new List<AgeGroup>(groups);
			}
		}

		public void AddGroup(AgeGroup group) {
			foreach (AgeGroup existing in groups)
				if (group.Collides(existing))
					throw new ArgumentException("Group collides with another one");
			groups.Add(group);
		}

		public void Save() {
			Save(Directory.GetCurrentDirectory());
		}

		public void Save(string path) {
			string dir = Path.GetFullPath(path + '\\' + this.Name + '\\');
			Directory.CreateDirectory(dir);
			StreamWriter file = new StreamWriter(dir + @".properties", true);
			file.WriteLine("Type: Subject");

			foreach (AgeGroup group in groups)
				group.Save(dir);

			file.Flush();
			file.Close();
		}

		public static Subject Load(string path) {
			string dir = Path.GetFullPath(path + '\\');
			StreamReader file = new StreamReader(dir + ".properties");
			if (file.ReadLine() != "Type: Subject")
				throw new ArgumentException(path + " doesn't contains Subject");

			string name = Directory.GetParent(dir).Name;
			Subject subject = new Subject(name);

			string[] groupDirs = Directory.GetDirectories(dir);
			foreach (string groupDir in groupDirs) {
				AgeGroup group = AgeGroup.Load(groupDir);
				subject.AddGroup(group);
			}

			file.Close();
			return subject;
		}

		public Subject(string name) {
			this.name = name;
			this.groups = new List<AgeGroup>();
		}
	}

	class AgeGroup {
		private int lowerLimit;
		private int upperLimit;
		private List<Participant> participants;
		private Participant winner;
		private Referee referee;

		public Referee Referee {
			get {
				return referee;
			}
			set {
				this.referee = value;
			}
		}

		public Participant Winner {
			get {
				return winner;
			}
			set {
				if (participants.Contains(value))
					this.winner = value;
				else
					throw new ArgumentException();
			}
		}

		public List<Participant> Participants {
			get {
				return new List<Participant>(participants);
			}
		}

		public int LowerLimit {
			get {
				return lowerLimit;
			}
		}

		public int UpperLimit {
			get {
				return upperLimit;
			}
		}

		public void AddParticipant(Participant participant) {
			if (participant.Age > this.UpperLimit || participant.Age < this.lowerLimit)
				throw new ArgumentException("Participant " + participant.Name + " doesn't belong to age group");
			else
				participants.Add(participant);
		}

		public bool Collides(AgeGroup anotherGroup) {
			if (this.LowerLimit < anotherGroup.LowerLimit)
				// time line: ------this group-------------->
				// time line: -------------another group---->
				return this.UpperLimit > anotherGroup.LowerLimit;
			else
				// time line: ---------------this group----->
				// time line: -----another group------------>
				return this.LowerLimit < anotherGroup.UpperLimit;
		}

		public void Save() {
			Save(Directory.GetCurrentDirectory());
		}

		public void Save(string path) {
			string dir = Path.GetFullPath(path + '\\' + this.LowerLimit + '-' + this.UpperLimit + '\\');
			Directory.CreateDirectory(dir);
			StreamWriter file = new StreamWriter(dir + ".properties");
			file.WriteLine("Type: AgeGroup");

			if (Winner == null)
				file.WriteLine("---");
			else
				file.WriteLine(Winner.Name);

			foreach (Participant participant in Participants) {
				participant.Save(dir + ".participants");
			}

			Referee.Save(dir);

			file.Flush();
			file.Close();
		}

		public static AgeGroup Load(string path) {
			string dir = Path.GetFullPath(path + '\\');
			StreamReader file = new StreamReader(dir + ".properties");
			if (file.ReadLine() != "Type: AgeGroup")
				throw new ArgumentException(path + " doesn't contains AgeGroup");

			string dirName = Directory.GetParent(dir).Name;
			string[] range = dirName.Split('-');
			int lowerLimit = int.Parse(range[0]);
			int upperLimit = int.Parse(range[1]);

			AgeGroup group = new AgeGroup(lowerLimit, upperLimit);

			string[] innerDirs = Directory.GetDirectories(dir);
			for (int i = 0; i < innerDirs.Length; i++) {
				string current = new DirectoryInfo(innerDirs[i]).Name;
				//find referee's directory (from ".properties", ".participants", and "REFEREE'S NAME") and load object. Note: can be null.
				if (current[0] != '.') {
					group.Referee = Referee.Load(innerDirs[i]);
					break;
				}
			}

			string winner = file.ReadLine();
			string[] participantsDirs = Directory.GetDirectories(dir + @".participants\");
			foreach (string participantDir in participantsDirs) {
				Participant participant = Participant.Load(participantDir);
				group.AddParticipant(participant);
				if (participant.Name == winner)
					group.Winner = participant;
			}

			file.Close();
			return group;
		}

		public AgeGroup(int lowerLimit, int upperLimit) {
			if (upperLimit < lowerLimit)
				throw new ArgumentException("Lower limit is less than upper one");
			else {
				this.lowerLimit = lowerLimit;
				this.upperLimit = upperLimit;
				participants = new List<Participant>();
			}
		}
	}

	class Participant {
		private string name;
		private int age;

		public string Name {
			get {
				return name;
			}
		}

		public int Age {
			get {
				return age;
			}
		}

		public void Save() {
			Save(Directory.GetCurrentDirectory());
		}

		public void Save(string path) {
			string dir = Path.GetFullPath(path + '\\' + this.Name + '\\');
			Directory.CreateDirectory(dir);
			StreamWriter file = new StreamWriter(dir + ".properties");
			file.WriteLine("Type: Participant");

			file.WriteLine(this.Age);

			file.Flush();
			file.Close();
		}

		public static Participant Load(string path) {
			string dir = Path.GetFullPath(path + '\\');
			StreamReader file = new StreamReader(dir + ".properties");
			if (file.ReadLine() != "Type: Participant")
				throw new ArgumentException(path + " doesn't contains Participant");

			string name = Directory.GetParent(dir).Name;
			int age = int.Parse(file.ReadLine());

			file.Close();
			return new Participant(name, age);
		}

		public Participant(string name, int age) {
			this.name = name;
			this.age = age;
		}
	}

	class Referee {
		private string name;
		private int age;
		private int experience;

		public string Name {
			get {
				return name;
			}
		}

		public int Age {
			get {
				return age;
			}
		}

		public int Experience {
			get {
				return experience;
			}
		}

		public void Save() {
			Save(Directory.GetCurrentDirectory());
		}

		public void Save(string path) {
			string dir = Path.GetFullPath(path + '\\' + this.Name + '\\');
			Directory.CreateDirectory(dir);
			StreamWriter file = new StreamWriter(dir + ".properties");
			file.WriteLine("Type: Referee");

			file.WriteLine(this.Age);
			file.WriteLine(this.Experience);

			file.Flush();
			file.Close();
		}

		public static Referee Load(string path) {
			string dir = Path.GetFullPath(path + '\\');
			StreamReader file = new StreamReader(dir + ".properties");
			if (file.ReadLine() != "Type: Referee")
				throw new ArgumentException(path + " doesn't contains Referee");

			string name = Directory.GetParent(dir).Name;
			int age = int.Parse(file.ReadLine());
			int experience = int.Parse(file.ReadLine());

			file.Close();
			return new Referee(name, age, experience);
		}

		public Referee(string name, int age, int experience) {
			this.name = name;
			this.age = age;
			this.experience = experience;
		}
	}

	class Program {
		static void Main(string[] args) {
			Subject labirynth = new Subject("Лабиринт");
			labirynth.AddGroup(new AgeGroup(10, 14));
			labirynth.AddGroup(new AgeGroup(15, 18));

			labirynth.Groups[0].AddParticipant(new Participant("Лёлик", 14));
			labirynth.Groups[0].AddParticipant(new Participant("Болик", 13));
			labirynth.Groups[0].AddParticipant(new Participant("Толик", 12));
			labirynth.Groups[0].Referee = new Referee("Анатолик", 30, 10);
			labirynth.Groups[0].Winner = labirynth.Groups[0].Participants[1];

			labirynth.Groups[1].AddParticipant(new Participant("Вася", 15));
			labirynth.Groups[1].AddParticipant(new Participant("Иннокентий", 17));
			labirynth.Groups[1].AddParticipant(new Participant("Нолик", 18));
			labirynth.Groups[1].Referee = new Referee("Иннокентий", 33, 11);
			labirynth.Groups[1].Winner = labirynth.Groups[1].Participants[1];

			Subject trajectory = new Subject("Траектория");
			trajectory.AddGroup(new AgeGroup(7, 13));
			trajectory.AddGroup(new AgeGroup(14, 16));

			trajectory.Groups[0].AddParticipant(new Participant("Он", 8));
			trajectory.Groups[0].AddParticipant(new Participant("Она", 9));
			trajectory.Groups[0].AddParticipant(new Participant("Фродо", 11));
			trajectory.Groups[0].Referee = new Referee("Тёма", 20, 2);
			trajectory.Groups[0].Winner = trajectory.Groups[0].Participants[2];

			trajectory.Groups[1].AddParticipant(new Participant("Оно", 15));
			trajectory.Groups[1].AddParticipant(new Participant("Они", 16));
			trajectory.Groups[1].AddParticipant(new Participant("Гендальф", 16));
			trajectory.Groups[1].Referee = new Referee("Стас Барецкий", 40, 22);
			trajectory.Groups[1].Winner = trajectory.Groups[1].Participants[2];

			labirynth.Save();
			trajectory.Save("ololo");

			Subject loaded = Subject.Load(@"ololo\Траектория");

			Console.ReadKey();
		}
	}
}
