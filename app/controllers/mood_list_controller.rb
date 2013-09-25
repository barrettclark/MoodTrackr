class MoodListController < UITableViewController
  CELLID = 'face'

  def viewDidLoad
    super
    view.dataSource = view.delegate = self
    average_mood = Mood.average
    if average_mood == :smile
      navigationItem.title = 'You\'re Happy'
    elsif average_mood == :neutral
      navigationItem.title = 'You\'re Eh'
    else
      navigationItem.title = 'You\'re Sad'
    end
  end

  # def tableView(tableView, titleForHeaderInSection:section)
  # end

  # def sectionIndexTitlesForTableView(tableView)
  # end

  # def tableView(tableView, sectionForSectionIndexTitle:title, atIndex:index)
  # end

  def tableView(tableView, numberOfRowsInSection:section)
    Mood.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.selectionStyle = UITableViewCellSelectionStyleBlue
      cell
    end
    mood = Mood.mood_for_row(indexPath.row)
    cell.textLabel.text = "#{mood.emoji} #{mood.name} - #{mood.created_at_pretty}"
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
  end
end
